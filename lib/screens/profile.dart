import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/Chat_With_Personal_shopper.dart';
import 'package:smart_personal_shopper/screens/Market/Market_screen.dart';
import 'package:smart_personal_shopper/widget/button.dart';
import 'package:smart_personal_shopper/widget/navbar.dart';
import 'List_of_Past_discussions.dart';
import 'home.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //responsive sized
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
          onPressed: () => Navigator.of(context).pop(),
        ),
        leadingWidth: 30,

        actions: [
          Container(
            width: 80,
            child: IconButton(
              alignment: Alignment.center,
              icon: const Icon(
                Icons.more_vert,
                size: 50,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          navbar(Home(), marketScreen(), Listof(), Profile(), context),
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
                            Color(0xff880e4f),
                            Color(0xffb71c1c)
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
                          child: Image.asset('images/pouya.jfif'),
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
                  "Pouya Ramirez",
                  style: TextStyle(
                      color: Colors.redAccent,
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
                      'Florida, USA',
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
                      'pouya.ramirez56@gmail.com',
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
                      '180.50',
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
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 300.00,
            child: buttonCustome('Edit Profile', Profile(), context),
          ),
        ],
      ),
    );
  }
}
