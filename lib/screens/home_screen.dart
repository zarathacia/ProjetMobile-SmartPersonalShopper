import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/Market/Market_items.dart';
import 'package:smart_personal_shopper/screens/profile.dart';

import '../constants.dart';
import 'Market/Market_screen.dart';
import 'Productscreen.dart';

class homeinterface extends StatelessWidget {
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
              child: Container(
                width: 90.0,
                height: 90.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: const AssetImage('images/profile.jpg'))),
              ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProductScreen()));
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.chat_outlined,
                  color: Colors.black,
                  size: 35,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
              ),
            ],
          ),
        ),
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
            color: PrimaryRed,
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
