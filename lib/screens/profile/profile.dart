import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/constants.dart';
import 'package:smart_personal_shopper/screens/home.dart';
import 'package:smart_personal_shopper/screens/homepage/home_screen.dart';
import 'package:smart_personal_shopper/widget/button.dart';
import 'edit_profile.dart';

class Profile extends StatefulWidget {
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {

  User? user = FirebaseAuth.instance.currentUser;
  String _userID = "";
  String _email = "test";
  String _fname = "";
  String _lname = "";
  String _location = "";
  String _credit = "";
  String _phonenumber = "";
  String _imageurl="";

  void getData() async {
    _userID = user!.uid;
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('userdata').doc(_userID).get();
    setState(() {
      _fname = userDoc.get('first name');
      _lname = userDoc.get('last name');
      _email = userDoc.get('email');
      _location = userDoc.get('location');
      _credit = userDoc.get('credit');
      _phonenumber = userDoc.get('phone number');
      _imageurl = userDoc.get('imageurl');
      //print('tdsdqdsest');
    });

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //responsive sized
    getData();
    //print(_userID);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent, //Color(0xff880e4f)
        elevation: 0.0,
        title: Text("Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25,
            )),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen())),
        ),
        leadingWidth: 30,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.45,
            child: Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.4 - 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            SecondaryRed,
                            PrimaryRed,
                          ])),
                  width: double.infinity,
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 110),
                      //height: 100,
                      child: CircleAvatar(
                        child: ClipRRect(
                          child: Image.network(_imageurl),
                          borderRadius: BorderRadius.circular(150),
                        ),
                        radius: 100.0,
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${_lname} ${_fname}",
                  style: TextStyle(
                      color: Color(0xFFff4d6d),
                      fontStyle: FontStyle.normal,
                      fontSize: 28.0),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.edit_location_outlined),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      _location,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.mail),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${_email}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.attach_money_sharp),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      _credit + " DT",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    /*Text(
                      'recharge your account',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),*/
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 300.00,
            child: buttonCustome('Edit Profile', EditProfile(), context),
          ),
        ],
      ),
    );
  }
}
