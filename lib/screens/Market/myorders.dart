import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/Confirm_receival.dart';

class MyOrders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LunchState();
}

class LunchState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Orders Screen",
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
        child: Wrap(
      children: <Widget>[
        Container(
          height: 370.0,
          child: ListView(
            children: <Widget>[
              dummyDataOfListView(
                  "images/pizza.png", "pizza neptune", "Cloths", "500Rs", 4),
              dummyDataOfListView(
                  "images/tomate.jpg", "1kg tomate", "Cloths", "600Rs", 1),
              dummyDataOfListView(
                  "images/hrissa.png", "hrissa sicam", "Cloths", "800Rs", 3),
              dummyDataOfListView(
                  "images/boga1.jpg", "Boga 1.5L", "Cloths", "100Rs", 4),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Your delivrer is on his way ",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Center(
            child: Container(
                margin: EdgeInsets.only(top: 30.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Confirm()));
                  }, // When Click on Button goto Login Screen

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xffb89686), Color(0xffd8c8be)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Container(
                      constraints: const BoxConstraints(
                          maxWidth: 350.0,
                          minHeight: 40.0), // min sizes for Material buttons
                      alignment: Alignment.center,
                      child: const Text(
                        'Confirm receival',
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
      String itemPrice, int itemCount) {
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
        trailing: Icon(Icons.refresh),
      ),
    ));
  }
}
