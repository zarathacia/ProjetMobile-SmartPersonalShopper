import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/constants.dart';
import 'package:smart_personal_shopper/controller/cart_controller.dart';
import 'package:smart_personal_shopper/data/cart/cart.dart';
import 'package:smart_personal_shopper/data/user.dart';
import 'package:smart_personal_shopper/services/cart_item_service.dart';

import 'myorders.dart';

ItemServices itemServices= ItemServices();
final  CartController controller=CartController();


class Checkout extends StatefulWidget {
  List<CartItem> cartItems = [];

  User chosenUser;
  String address="Florida, Miami, House no:938";
  Checkout({
    required this.chosenUser,required this.address});


  @override
  _checkout createState() => _checkout();
}

class _checkout extends State<Checkout> {

  @override
  Widget build(BuildContext context) {

    setState(() {
      controller.onInit();
      widget.cartItems=controller.cartItems;
    });


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          title: Text(
            "Checkout",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: initScreen(widget.cartItems));
  }

  initScreen(List<CartItem> cartItems) {
    double total = 0;
    double discount = 10;
    cartItems=controller.cartItems;

    if(cartItems.isEmpty)
    {
      return Container(
        child: Text(
          "You have an empty Cart back to shopping",
          style: TextStyle(color: Colors.black54, fontSize: 18.0),
        ),
      );
    }
    cartItems.forEach((element) {
      total+=element.price*element.quantity;
    });
    total = (total * (1 - discount / 100));
    return new Container(
        child: Wrap(
      children: <Widget>[
        Container(
          height: 370.0,
          child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
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
        ),
        Container(
            padding: EdgeInsets.only(top: 20.0, right: 25.0, left: 25.0),
            child: Text(
              widget.address,
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            )),
        Container(
          margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Your personal shopper is: " ,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Text(
                widget.chosenUser.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Discount: ",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Text(
                "$discount %",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Total: ",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "$total DT",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Center(
            child: Container(
                margin: EdgeInsets.only(top: 30.0),
                child: RaisedButton(
                  onPressed: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyOrders()));
                    AwesomeDialog(
                      context: context,
                      keyboardAware: true,
                      dismissOnBackKeyPress: false,
                      dialogType: DialogType.WARNING,
                      animType: AnimType.BOTTOMSLIDE,
                      btnCancelText: "Cancel Order",
                      btnOkText: "Yes, I will pay",
                      title: 'Continue to pay?',
                      // padding: const EdgeInsets.all(5.0),
                      desc:
                          'Please confirm that you will pay $total dt . Creating orders without paying will create penalty charges, and your account may be disabled.',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyOrders(
                              cartItems: widget.cartItems,
                              address: widget.address,
                              deliveryName: widget.chosenUser.name,

                            )));
                      },
                      btnOkColor: SecondaryRed,
                      btnCancelColor: Colors.grey[500],
                    ).show();
                  }, // When Click on Button goto Login Screen

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [PrimaryRed, SecondaryRed],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Container(
                      constraints: const BoxConstraints(
                          maxWidth: 350.0,
                          minHeight: 40.0), // min sizes for Material buttons
                      alignment: Alignment.center,
                      child: const Text(
                        'Buy',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),

                  ),
                ))),
      ],
    ));
  }

  CartItemView(String id,String imgSrc, String itemName, String itemCategory,
      String itemPrice, int itemCount) {
    if(itemName.length>20){
      itemName=itemName.substring(0,15);
    }
    return Container(
        child: Card(
      elevation: 4.0,
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 5.0),
      color: Color(0xffFFFFFF),
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
                  itemCategory,
                  style: TextStyle(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 3.0),
                child: Text(
                  '$itemPrice DT',
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
