/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/home.dart';

Widget navbar(Widget page1, Widget page2, Widget page3, Widget page4, context) {
  return BottomAppBar(
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
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return page1;
              }));
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return page2;
              }));
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.chat_outlined,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return page3;
              }));
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return page4;
              }));
            },
          ),
        ],
      ),
    ),
  );
}*/
