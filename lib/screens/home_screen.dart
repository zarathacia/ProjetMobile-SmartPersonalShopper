import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/Market/Market_items.dart';
import 'package:smart_personal_shopper/screens/profile.dart';

import 'Market/Market_screen.dart';
import 'Productscreen.dart';

class homeinterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screensize.height*0.1,
        backgroundColor: const
        Color(0xFFff4d6d),
        elevation: 0.0,

        actions: <Widget>[
          TextButton(
            style: style,
            onPressed: () {},
            child: const Text('Credit:180.52 DT'),
          ),
          TextButton(
              style: style,
              onPressed: () {},
              child: new Container(
                width: 60.0,
                height: 60.0,
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
          Container(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Welcome Message',
                  filled: true,
                  fillColor: Colors.black12,
                ),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => marketScreen()));
            },
            color:  Color(0xffc9184a),
            child: const Text(
              'Start Ordering here',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 36),
                    child: Text(
                      'Deals :',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: const AssetImage('images/hrissa.jpg'))),
                    ),
                    Container(
                        width: 250.0,
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor posuere eleifend. ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('images/pizza.jfif'))),
                    ),
                    Container(
                        width: 250.0,
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor posuere eleifend. ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: const AssetImage('images/boga1.jpg'))),
                    ),
                    Container(
                        width: 250.0,
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor posuere eleifend. ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
