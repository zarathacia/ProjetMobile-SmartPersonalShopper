import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_personal_shopper/screens/home1.dart';
import 'package:smart_personal_shopper/widget/theme_helper.dart';

import '../screens/home.dart';
import '../screens/login_registration/login.dart';
import '../screens/login_registration/login.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  late Timer timer;

  @override
  void initState() {

    //user = auth.currentUser!;
    user?.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/back.png"), fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: screensize.width * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                Container(
                  height: screensize.height * 0.6,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: screensize.width * 0.3,
                            right: screensize.width * 0.05,
                            left: screensize.width * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'images/ic_launcher.png',
                                ),
                                height: screensize.height * 0.2,
                                width: screensize.width * 0.8,
                              ),
                            ),
                            SizedBox(height: screensize.width * 0.06),
                            Text(
                              'please verify your email', textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: screensize.width * 0.04,
                                color: Color(0xFFff4d6d),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'or ', textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: screensize.width * 0.04,
                                color: Color(0xFFff4d6d),
                              ),
                            ),
                            SizedBox(height: 10,),
                            GestureDetector(
                              child: Text(
                                'go back to login page ', textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: screensize.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFff4d6d),
                                ),
                              ),
                              onTap: (){Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Login()));}
                            ),

                          ],

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: screensize.width * 0.3,
                            right: screensize.width * 0.05,
                            left: screensize.width * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'images/deliv4.png',
                                ),
                                height: screensize.height * 0.21,
                                width: screensize.width * 0.8,
                              ),
                            ),
                            SizedBox(height: screensize.width * 0.06),

                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: screensize.width * 0.3,
                            right: screensize.width * 0.05,
                            left: screensize.width * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'images/deliv1.png',
                                ),
                                height: screensize.height * 0.22,
                                width: screensize.width * 0.8,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser!;
    await user?.reload();
    if (user!.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Home()));
    }
  }
}