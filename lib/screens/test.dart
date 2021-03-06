import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/data/product/product.dart';

final productsRef = FirebaseFirestore.instance
    .collection('products')
    .withConverter<Product>(
  fromFirestore: (snapshots, _) => Product.fromJson(snapshots.data()!),
  toFirestore: (product, _) => product.toJson(),
);


/// Holds all example app films
class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Firestore Example: Product'),

            StreamBuilder(
              stream: FirebaseFirestore.instance.snapshotsInSync(),
              builder: (context, _) {
                return Text(
                  'Latest Snapshot: ${DateTime.now()}',
                  style: Theme.of(context).textTheme.caption,
                );
              },
            )
          ],
        ),
      ),
      body:
      StreamBuilder<QuerySnapshot<Product>>(
        stream: productsRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.requireData;

          return ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index) {
              return _ProductItem(
                data.docs[index].data(),
                data.docs[index].reference,
              );
            },
          );
        },
      ),
    );
  }

}

/// A single movie row.
class _ProductItem extends StatelessWidget {
  _ProductItem(this.product, this.reference);

  final Product product;
  final DocumentReference<Product> reference;

  /// Returns the movie poster.
  Widget get image {
    return SizedBox(
      width: 100,
      child: Image.network(product.image),
    );
  }

  /// Returns movie details.
  Widget get details {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          name,
        ],
      ),
    );
  }

  /// Return the movie title.
  Widget get name {
    return Text(
      '${product.name} (${product.description})',
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          name,
          image,
          Flexible(child: details),
        ],
      ),
    );
  }
}

