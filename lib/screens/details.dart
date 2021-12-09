import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/data/product/ProductItems.dart';
import 'package:smart_personal_shopper/screens/profile.dart';
import 'package:smart_personal_shopper/constants.dart';

import 'Productscreen.dart';

class details extends StatelessWidget {
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
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            style: style,
            onPressed: () {},
            child: const Text('Credit 180.52£'),
          ),
          TextButton(
              style: style,
              onPressed: () {},
              child: new Container(
                width: 90.0,
                height: 90.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('images/profile.jpg'))),
              ))
        ],
      ),
      body: Column(
        children: <Widget>[
          Text(
            'choose your product',
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
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(25.7),
                              borderSide: BorderSide(color: Colors.black)),
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
              Item(
                title: '',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Item extends StatefulWidget {
  const Item({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Item> createState() => _Item();
}

class _Item extends State<Item> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Container(
            height: 400,
            width: 500,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      'images/hrissa.jpg',
                      height: 150,
                      width: 150,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'hrissa sicam',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.red,
                          ),
                        ),

                        Text(
                          'prix unitaire : 0.85 £',
                          style: TextStyle(fontSize: 25),
                        ),

                        //   FloatingActionButton(
                        // onPressed: _incrementCounter,
                        // tooltip: 'Increment',
                        // child: const Icon(Icons.add),
                        //),
                        Text(
                          'Total : 22.85 £',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ],
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  color: Colors.red,
                  child: Text(
                    'Add To Cart',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                Text(
                  'Details',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor posuere eleifend. Etiam ut imperdiet odio, id euismod nisi. Nunc vulputate quis orci id luctus. Nulla facilisi. Vestibulum vulputate laoreet massa, vitae tempus nulla iaculis nec. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
