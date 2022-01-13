import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/constants.dart';
import 'package:smart_personal_shopper/screens/homepage/home_screen.dart';
import 'package:smart_personal_shopper/screens/profile/profile.dart';
import 'package:smart_personal_shopper/widget/rating.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../widget/navbar.dart';
import 'chat/List_of_Past_discussions.dart';
import 'Market/Market_screen.dart';
import 'home.dart';

class Confirm extends StatelessWidget {
  late double _ratingValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Confirm receival",
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Rate your provider',
              style: TextStyle(color: Colors.grey, fontSize: 30),
            ),
            SizedBox(
              height: 50,
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
                          'images/user5.jpg',
                          width: 120,
                        ),
                      ),
                    ),
                    Text(
                      'Emma',
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
            SizedBox(
              height: 80,
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Feedback", // Set text upper animation
                  border: OutlineInputBorder(),
                ),
                minLines: 1,
                autofocus: false,
                keyboardType: TextInputType.text,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: () {
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Confirm()));

                AwesomeDialog(
                  context: context,
                  animType: AnimType.LEFTSLIDE,
                  headerAnimationLoop: false,
                  dialogType: DialogType.SUCCES,
                  showCloseIcon: true,
                  btnOkColor: SecondaryRed,
                  title: 'Succes',
                  desc: 'Shopping Done',
                  btnOkOnPress: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => Home()));
                  },
                )..show();
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
                    'Confirm receipt',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
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
