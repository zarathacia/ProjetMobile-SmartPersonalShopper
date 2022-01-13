import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/constants.dart';
import 'package:smart_personal_shopper/data/cart/cart.dart';
import 'package:smart_personal_shopper/data/product/product.dart';
import 'package:smart_personal_shopper/screens/Payment/paycard.dart';
import 'package:smart_personal_shopper/screens/home.dart';
import 'package:smart_personal_shopper/screens/homepage/home_screen.dart';
import 'package:smart_personal_shopper/screens/profile/profile.dart';
import 'details.dart';

Product currentProduct = Product(
    id: "001",
    name: "harissa",
    description: "lorem",
    price: "0.8",
    review: "8",
    image: "images/hrissa.png");
final productsRef =
    FirebaseFirestore.instance.collection('products').withConverter<Product>(
          fromFirestore: (snapshots, _) => Product.fromJson(snapshots.data()!),
          toFirestore: (product, _) => product.toJson(),
        );

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  TextEditingController controller = new TextEditingController();
  late String filter;
  @override
  void initState() {
    controller.addListener(() {
      filter = controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;

    final ButtonStyle style = TextButton.styleFrom(
      primary: PrimaryRed,
    );
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: screensize.height * 0.1,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.red,
            size: 40,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        leadingWidth: 30,
        actions: <Widget>[
          TextButton(
            style: style,
            onPressed: () {
              AwesomeDialog(
                context: context,
                headerAnimationLoop: false,
                dialogType: DialogType.NO_HEADER,
                title: 'Your have 180.52 DT',
                desc: 'Do you want to recharge your account?',
                btnCancelText: "No",
                btnOkText: "Recharge",
                btnCancelOnPress: () {},
                btnOkOnPress: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => MyCard()));
                },
                btnOkColor: SecondaryRed,
                btnCancelColor: Colors.grey[500],
              )..show();
            },
            child: const Text('Credit:180.52 DT'),
          ),
          TextButton(
              style: style,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Profile()));
              },
              child: new Container(
                width: 70.0,
                height: 45.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/shopili-mobile-project.appspot.com/o/profilepics%2F20211117-122907%20(4).jpg?alt=media&token=d832fc87-0175-400c-ac39-17a6fad2834d'))),
              ))
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Product>>(
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

            return Column(
              children: <Widget>[
                Text(
                  'choose your products',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 2,
                    fontSize: 30,
                    color: Colors.grey,
                  ),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 80,
                            padding: EdgeInsets.only(
                              top: 35,
                              left: 15,
                              right: 5,
                              bottom: 5,
                            ),
                            width: double.infinity,
                            color: Colors.white10,
                            child: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.7),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                focusedBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.7),
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                labelText: 'search',
                                filled: true,
                                fillColor: Colors.white12,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 80,
                          color: Colors.white,
                          padding: EdgeInsets.only(top: 25, right: 15),
                          child: Icon(Icons.search),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GridView.builder(
                        itemCount: data.size,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 20.0,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) {
                          return ItemCard(
                            data.docs[index].data(),
                            data.docs[index].reference,
                          );
                        }),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class ItemCard extends StatelessWidget {
  ItemCard(this.product, this.reference);

  final Product product;
  final DocumentReference<Product> reference;

  //on tap send the id of the item to the details.dart
  void onTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => details.product(currentProduct: product)));
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    String description;
    if (product.description.length > 10) {
      description = product.description.substring(0, 10) + "... [more]";
    } else {
      description = product.description + "... [more]";
    }
    return InkWell(
      onTap: () => onTap(context),
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    height: screensize.height * 0.25,
                    width: screensize.width * 0.5,
                    decoration: BoxDecoration(
                      color: PrimaryGrey.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: SecondaryRed,
                        width: 1,
                      ),
                    ),
                    child: LayoutBuilder(
                      builder: (_, constraints) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                                tag: product.hashCode,
                                child: SizedBox(
                                    child: Image.network(product.image),
                                    height: constraints.maxHeight * 0.4)),
                            SizedBox(height: 10),
                            Text(
                              product.name,
                              style: TextStyle(color: PrimaryRed),
                            ),
                            Text(
                              description,
                              style: TextStyle(color: PrimaryRed),
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${product.price} dt',
                                  style: TextStyle(color: PrimaryRed)
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  padding: const EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    color: PrimaryRed,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IconButton(
                                    //////////////////
                                    icon: Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      CartItem item = CartItem(
                                          id: product.id,
                                          name: product.name,
                                          quantity: numOfItems,
                                          price: double.parse(product.price),
                                          image: product.image,
                                          datetime: DateTime.now().toString());
                                      print("pressed");
                                      controller.addToCart(item);
                                      controller.onInit();
                                      AwesomeDialog(
                                        context: context,
                                        animType: AnimType.LEFTSLIDE,
                                        headerAnimationLoop: false,
                                        dialogType: DialogType.SUCCES,
                                        showCloseIcon: true,
                                        title: 'Alert',
                                        desc: numOfItems.toString() +
                                            "Items Added Successfully",
                                      ).show();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
