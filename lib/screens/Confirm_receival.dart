import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:smart_personal_shopper/widget/rating.dart';

class Confirm extends StatelessWidget {
  late double _ratingValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            RaisedButton(
                onPressed: () {},
                child: Text('Confirm receipt'),
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            SizedBox(
              height: 100,
            ),
            Text(
              'Review personal shopper',
              style: TextStyle(fontSize: 20),
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
                          width: 100,
                        ),
                      ),
                    ),
                    Text('Jakie chong'),
                  ],
                ),
                SizedBox(
                  width: 10,
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
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('_ratingValue', _ratingValue));
  }
}
