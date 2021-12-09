import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/profile.dart';
import 'package:smart_personal_shopper/widget/rating.dart';

import '../widget/navbar.dart';
import 'List_of_Past_discussions.dart';
import 'Market/Market_screen.dart';
import 'home.dart';

class Confirm extends StatelessWidget {
  late double _ratingValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xffb89686),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Confirm receival of goods',
              style: TextStyle(color: Colors.grey, fontSize: 30),
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
                onPressed: () {},
                child: Text('Confirm receipt'),
                color:Color(0xffb89686),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            SizedBox(
              height: 70,
            ),
            Text(
              'Review personal shopper',
              style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.asset(
                          'images/shopper1.png',
                          width: 120,
                        ),
                      ),
                    ),
                    Text(
                      'Jakie chong',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    Text('rate execution'),
                    rating(5),
                    SizedBox(
                      height: 20,
                    ),
                    Text('rate behaviour'),
                    rating(5),
                    SizedBox(
                      height: 20,
                    ),
                    Text('rate quality of goods'),
                    rating(5),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      /*bottomNavigationBar:
          navbar(Home(), marketScreen(), Listof(), Profile(), context),*/
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('_ratingValue', _ratingValue));
  }
}
