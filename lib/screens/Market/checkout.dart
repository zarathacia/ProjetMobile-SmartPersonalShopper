import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/constants.dart';

import 'myorders.dart';

class Checkout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LunchState();
}

class LunchState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
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
        body: initScreen());
  }

  initScreen() {
    double total = 2 * 5 + 0.9 + 0.8 + 2.85;
    double totalf = 0;
    double discount = 10;
    double shipping = 2;
    totalf = (total * (1 - discount / 100) + shipping);
    String totalfs = (totalf).toStringAsFixed(3);
    return new Container(
        child: Wrap(
      children: <Widget>[
        Container(
          height: 370.0,
          child: ListView(
            children: <Widget>[
              dummyDataOfListView(
                  "images/pizza.png", "pizza neptune", "food", 5, 2),
              dummyDataOfListView(
                  "images/tomate.png", "1kg tomate", "food", 0.9, 1),
              dummyDataOfListView(
                  "images/hrissa.png", "hrissa sicam", "food", 0.8, 1),
              dummyDataOfListView(
                  "images/boga.png", "Boga 1.5L", "food", 2.850, 1),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 20.0, right: 25.0, left: 25.0),
            child: Text(
              "Florida, Miami, House no:938, Road: 9",
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            )),
        Container(
          margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Best Sale: ",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Text(
                "$total",
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
          margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Shipping: ",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Text(
                "$shipping",
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
                "$totalfs DT",
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
                          'Please confirm that you will pay $totalfs dt . Creating orders without paying will create penalty charges, and your account may be disabled.',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyOrders()));
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

  dummyDataOfListView(String imgSrc, String itemName, String itemCategory,
      double itemPrice, int itemCount) {
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
