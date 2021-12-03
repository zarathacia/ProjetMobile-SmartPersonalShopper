import 'dart:html';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/Market/Market_items.dart';
import 'package:smart_personal_shopper/screens/profile.dart';

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
              child: new Container(
                width:90.0,
                height:90.0,
                decoration: new BoxDecoration(
                    shape:BoxShape.circle,
                    image: new DecorationImage(
                        fit : BoxFit.fill,
                        image: const AssetImage('images/profile.jpg'))
                ),
              )
          )
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
                onPressed: () {Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));},
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
      body:Column(
        children: <Widget>[
          Container(
            child:
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child:
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Welcome Message',
                filled:true,
                fillColor: Colors.black12,
              ),

            ),

          ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => marketScreen()));
            },


            color: Colors.red,
            child: const Text(
              'Start Ordering here',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        Column(
            children: [Align(
              alignment: Alignment.centerLeft,
                child:
                Container(
                  child:
                  const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 36),
                child:
                  Text(
                  'Deals :',
                style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 35),
          ),
    ),
        ),
    ),
        ],),
        Column(
        children: [Align(
            alignment: Alignment.centerLeft,
              child:Row(

                children: <Widget>[
                  new Container(
                    width:120.0,
                    height:120.0,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                            fit : BoxFit.fill,
                            image: const AssetImage('images/hrissa.jpg'))
                    ),
                  ),
              new Container(
                width:400.0,
                 child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor posuere eleifend. Etiam ut imperdiet odio, id euismod nisi. Nunc vulputate quis orci id luctus. Nulla facilisi. Vestibulum vulputate laoreet massa, vitae tempus nulla iaculis nec. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15),)
              ),
                ],

    ),
    ),
    ],
        ),
          Column(
            children: [Align(
              alignment: Alignment.centerLeft,
              child:Row(

                children: <Widget>[
                  new Container(
                    width:120.0,
                    height:120.0,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                            fit : BoxFit.fill,
                            image: const AssetImage('images/pizza.jfif'))
                    ),
                  ),
                  new Container(
                      width:400.0,
                      child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor posuere eleifend. Etiam ut imperdiet odio, id euismod nisi. Nunc vulputate quis orci id luctus. Nulla facilisi. Vestibulum vulputate laoreet massa, vitae tempus nulla iaculis nec. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15),)
                  ),
                ],

              ),
            ),
            ],
          ),
          Column(
            children: [Align(
              alignment: Alignment.centerLeft,
              child:Row(

                children: <Widget>[
                  new Container(
                    width:120.0,
                    height:120.0,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                            fit : BoxFit.fill,
                            image: const AssetImage('images/boga1.jpg'))
                    ),
                  ),
                  new Container(
                      width:400.0,
                      child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor posuere eleifend. Etiam ut imperdiet odio, id euismod nisi. Nunc vulputate quis orci id luctus. Nulla facilisi. Vestibulum vulputate laoreet massa, vitae tempus nulla iaculis nec. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15),)
                  ),
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