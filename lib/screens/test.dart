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

enum ProductQuery {
  name,
  priceAsc,
  priceDesc
}

extension on Query<Product> {
  Query<Product> queryBy(ProductQuery query) {
    switch (query) {
      case ProductQuery.priceAsc:
      case ProductQuery.priceDesc:
        return orderBy('price', descending: query == ProductQuery.priceDesc);

      case ProductQuery.name:
        return orderBy('name', descending: true);

    }
  }
}

/// Holds all example app films
class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ProductQuery query = ProductQuery.name;

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
        actions: <Widget>[
          PopupMenuButton<ProductQuery>(
            onSelected: (value) => setState(() => query = value),
            icon: const Icon(Icons.sort),
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: ProductQuery.name,
                  child: Text('Sort by name'),
                ),
                const PopupMenuItem(
                  value: ProductQuery.priceAsc,
                  child: Text('Sort by ascending price'),
                ),
                const PopupMenuItem(
                  value: ProductQuery.priceDesc,
                  child: Text('Sort by price descending'),
                ),

              ];
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Product>>(
        stream: productsRef.queryBy(query).snapshots(),
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

