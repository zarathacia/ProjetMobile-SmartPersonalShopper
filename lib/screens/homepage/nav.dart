import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_personal_shopper/screens/chat/List_of_Past_discussions.dart';
import 'package:smart_personal_shopper/screens/login_registration/login.dart';
import 'package:smart_personal_shopper/screens/settings.dart';

import '../../widget/textfield.dart';
import '../chat/Chat_With_Personal_shopper.dart';
import 'package:smart_personal_shopper/screens/profile/profile.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  User? user = FirebaseAuth.instance.currentUser;
  String userID = "";
  String email = "";
  String fname = "";
  String lname = "";
  String credit = "";
  String imageurl = "";
  void getData() async {
    userID = user!.uid;
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('userdata')
        .doc(userID)
        .get();
    setState(() {
      fname = userDoc.get('first name');
      lname = userDoc.get('last name');
      email = userDoc.get('email');
      credit = userDoc.get('credit');
      imageurl = userDoc.get('imageurl');
      //print('tdsdqdsest');
    });
  }

  @override
  Widget build(BuildContext context) {
    //print('nav now');
    //getData();
    print('$fname');
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('$userID $lname'),
            accountEmail: Text('$email'),
            currentAccountPicture: CircleAvatar(
              child: ClipRRect(
                child: Image.network('$imageurl'),
                borderRadius: BorderRadius.circular(150),
              ),
              radius: 100.0,
            ),
          ),
          ListTile(
              leading: Icon(Icons.person),
              title: Text('chat'),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Listof()))),
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
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Setting())),
          ),
          Divider(),
          ListTile(
              title: Text('Exit'),
              leading: Icon(Icons.exit_to_app),
              onTap: () => SystemNavigator.pop()),
        ],
      ),
    );
  }
}
