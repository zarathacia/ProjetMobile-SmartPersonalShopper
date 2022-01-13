import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/login_registration/login.dart';

import '../../widget/textfield.dart';
import '../chat/Chat_With_Personal_shopper.dart';

class NavBar extends StatefulWidget {

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  User? user = FirebaseAuth.instance.currentUser;
  String _userID = "";
  String _email ="";
  String _fname = "";
  String _lname = "";
  String _password = "";
  String _location ="";
  String _credit="";
  String _phonenumber ="";
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
      _password = userDoc.get('password');
      //print('$_password');
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    print('_fname');
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('$_fname $_lname'),
            accountEmail: Text('$_email'),
            currentAccountPicture: CircleAvatar(
              child: ClipRRect(
                child: Image.network('$_imageurl'),
                borderRadius: BorderRadius.circular(150),
              ),
              radius: 100.0,
            ),
          ),
          ListTile(
              leading: Icon(Icons.person),
              title: Text('chat'),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Chat()))),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
            onTap: () => null,
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
              title: Text('Exit'),
              leading: Icon(Icons.exit_to_app),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Login()))),
        ],
      ),
    );
  }
}
