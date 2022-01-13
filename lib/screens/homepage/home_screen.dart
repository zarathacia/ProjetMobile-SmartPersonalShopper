import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/Market/filter.dart';
import 'package:smart_personal_shopper/screens/Payment/paycard.dart';
import 'package:smart_personal_shopper/screens/homepage/food.dart';
import 'package:smart_personal_shopper/screens/homepage/groceries.dart';
import 'package:smart_personal_shopper/screens/homepage/house.dart';
import 'package:smart_personal_shopper/screens/homepage/nav.dart';
import 'package:smart_personal_shopper/screens/homepage/snackes.dart';
import 'package:smart_personal_shopper/constants.dart';
import 'package:smart_personal_shopper/screens/profile/profile.dart';
import '../../constants.dart';
import '../../widget/textfield.dart';

class HomeScreen extends StatefulWidget {

  @override
  HomeScreenState createState() => HomeScreenState();

}

class HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {

    //return Scaffold(
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryList(),
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: PrimaryRed,
      ),
    );
    /*body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            CategoryList(),
          ],
        ),
      ),
    );*/
  }
}

class CategoryList extends StatefulWidget {


  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
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
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Food'),
    Tab(text: 'Groceries'),
    Tab(text: 'House materials'),
    Tab(text: 'Snacks & Sides'),
  ];

  final List<Widget> myTabs_widget = <Widget>[
    food(),
    groceries(),
    house(),
    snackes(),
  ];

  final ButtonStyle style = TextButton.styleFrom(primary: Color(0xff8e1d1e));

  @override
  Widget build(BuildContext context) {
    getData();
    print(_fname);
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        drawer: NavBar(),
        backgroundColor: PrimaryRed,
        appBar: AppBar(
          iconTheme: IconThemeData(color: PrimaryRed),
          backgroundColor: Colors.white,
          bottom: TabBar(
            tabs: myTabs,
            labelColor: PrimaryRed,
            indicatorColor: PrimaryRed,
          ),
          actions: <Widget>[
            TextButton(
              style: style,
              onPressed: () {
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyCard()));
                AwesomeDialog(
                  context: context,
                  headerAnimationLoop: false,
                  dialogType: DialogType.NO_HEADER,
                  title: 'Your have 180.52 DT',
                  desc: 'Do you want to recharge your account?',
                  btnCancelText: "No",
                  btnOkText: "Recharge",
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyCard()));
                  },
                  btnOkColor: SecondaryRed,
                  btnCancelColor: Colors.grey[500],
                )..show();
              },
              child: Text('Credit:180.52 DT'),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => filter()));
              },
              icon: const Icon(Icons.search),
            ),
            TextButton(
                style: style,
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Profile()));
                },
                child: new Container(
                  width: 70.0,
                  height: 45.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage('$_imageurl'))),
                ))
          ],
        ),
        body: TabBarView(
          children: myTabs.map((Tab tab) {
            final String? label = tab.text;
            final index1 = myTabs.indexOf(tab);
            return Center(
              child: myTabs_widget[index1],
            );
          }).toList(),
        ),
      ),
    );
  }
}
