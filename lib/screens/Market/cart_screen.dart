import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/constants.dart';
import 'package:smart_personal_shopper/controller/cart_controller.dart';
import 'package:smart_personal_shopper/data/cart/cart.dart';
import 'package:smart_personal_shopper/data/cart/cart.dart';
import 'package:smart_personal_shopper/screens/choose_your_personal_shopper.dart';
import 'package:smart_personal_shopper/screens/Market/details.dart';
import 'package:smart_personal_shopper/services/cart_item_service.dart';
import 'address.dart';


ItemServices itemServices= ItemServices();
final  CartController controller=CartController();

User? user = FirebaseAuth.instance.currentUser;


class CartScreen extends StatefulWidget {
  List<CartItem> cartItems = [];

  CartScreen.cartList({required this.cartItems});

  CartScreen({Key? key}):super(key:key);
  @override
  State<StatefulWidget> createState() => LunchState();
}

class LunchState extends State<CartScreen> {

  Widget build(BuildContext context) {
    controller.onInit();
    print("Size of cartItems");
    print(controller.cartItems.length);


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
      body:
            initScreen(widget.cartItems),

    );
  }

  initScreen(List<CartItem> cartItems) {
    return Container(
        child: Stack(
          children: <Widget>[
            ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context,index){
              return CartItemView(
                cartItems[index].id,
                cartItems[index].image,
                cartItems[index].name,
                "Item Category",
                cartItems[index].price.toString(),
                cartItems[index].quantity,
              );
          },
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
          ]
    ),
    );

  }

  CartItemView(String id,String imgSrc, String itemName, String itemCategory,
      String itemPrice, int itemCount) {

    if(itemName.length>20){
    itemName=itemName.substring(0,15);
    }
    return Container(
        child: Card(
          margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
          color: Color(0xffEEEEEE),
          child: ListTile(
            // on ListItem clicked
            onTap: () {},

            // Image of ListItem
            leading: Container(
              child:SizedBox(
                    width:100,
                    child:Image.network(imgSrc),
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
                      itemName,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 3.0),
                    child: Text(
                      "Category",
                      style: TextStyle(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 3.0),
                    child: Text(
                      itemPrice,
                      style: TextStyle(color: Color(0xff374ABE)),
                    ),
                  ),
                ],
              ),
            ),

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
            trailing:
            GestureDetector(
              onTap: () {
                controller.removeFromCart(id);
                controller.onInit();
                setState(() {
                    widget.cartItems=controller.cartItems;
                });
                controller.onInit();
              },
              child: Icon(
                Icons.cancel,
                size: 25,
              ),
            ),
          ),
        ));
  }
}