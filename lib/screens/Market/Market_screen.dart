import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/Market/Market_items.dart';
import 'package:smart_personal_shopper/widget/navbar.dart';
import '../Chat_With_Personal_shopper.dart';
import '../home.dart';
import '../profile.dart';
import 'List_of_Past_discussions.dart';
import 'Market_items.dart';

class marketScreen extends StatelessWidget {
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
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text(
                'choose your market',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 2,
                  fontSize: 30,
                  color: Colors.grey,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: <Widget>[
                    Image.asset(markets[0].image),
                    Text(
                      markets[0].title,
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
            ],
          )),
      bottomNavigationBar:
          navbar(Home(), marketScreen(), Listof(), Profile(), context),
    );
  }
}
