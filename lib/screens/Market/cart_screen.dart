import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/constants.dart';
import 'package:smart_personal_shopper/data/cart/cart.dart';
import 'package:smart_personal_shopper/screens/choose_your_personal_shopper.dart';
import 'package:smart_personal_shopper/screens/Market/details.dart';
import 'address.dart';

final productsRef = FirebaseFirestore.instance
    .collection('carts')
    .withConverter<Cart>(
  fromFirestore: (snapshots, _) => Cart.fromJson(snapshots.data()!),
  toFirestore: (cart, _) => cart.toJson(),
);

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}):super(key:key);
  @override
  State<StatefulWidget> createState() => LunchState();
}

class LunchState extends State<CartScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 5.0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: initScreen(),
    );
  }

  initScreen() {
    return new Container(
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                dummyDataOfListView(
                    "images/pizza.png", "pizza neptune", "Cloths", "500Rs", 4),
                dummyDataOfListView(
                    "images/tomate.png", "1kg tomate", "Cloths", "600Rs", 1),
                dummyDataOfListView(
                    "images/hrissa.png", "hrissa sicam", "Cloths", "800Rs", 3),
                dummyDataOfListView(
                    "images/boga.png", "Boga 1.5L", "Cloths", "100Rs", 4),
              ],
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                height: 50.0,
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Choose()));
                },
                color: SecondaryRed,
                minWidth: double.maxFinite,
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            )
          ],
        ));
  }

  dummyDataOfListView(String imgSrc, String itemName, String itemCategory,
      String itemPrice, int itemCount) {
    return Container(
        child: Card(
          margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
          color: Color(0xffEEEEEE),
          child: ListTile(
            // on ListItem clicked
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => details()));
            },

            // Image of ListItem
            leading: Container(
              child: Image(
                fit: BoxFit.fitHeight,
                image: AssetImage(imgSrc),
              ),
            ),

            // Lists of titles
            title: Container(
              margin: EdgeInsets.only(top: 10.0),
              height: 80.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 2.0),
                    child: Text(
                      "Item Name",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 3.0),
                    child: Text(
                      "Item Cetegory",
                      style: TextStyle(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 3.0),
                    child: Text(
                      "500 RS",
                      style: TextStyle(color: Color(0xff374ABE)),
                    ),
                  ),
                ],
              ),
            ),

            // Item Add and Remove Container
            subtitle: Container(
                child: Wrap(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        if (itemCount < 0) {
                          itemCount = 0;
                        } else {
                          itemCount--;
                        }
                      },
                      child: Icon(
                        Icons.remove,
                        size: 19.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0, top: 1.0, right: 10.0),
                      child: Text(
                        itemCount.toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),

                    // Add count button
                    GestureDetector(
                      onTap: () {
                        itemCount++;
                      },
                      child: Icon(
                        Icons.add,
                        size: 19.0,
                      ),
                    ),
                  ],
                )),

            // trailing shows the widget on the right corner of the list item
            trailing: Icon(Icons.cancel),
          ),
        ));
  }
}