import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:smart_personal_shopper/constants.dart';
import 'package:smart_personal_shopper/screens/home1.dart';
import 'Market/Market_screen.dart';
import 'List_of_Past_discussions.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPage = 0;
  final _pageOptions = [Home1(), marketScreen(), Listof(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: selectedPage,
        onTap: (int index) {
          setState(() {
            selectedPage = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            //selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            title: Text("Market"),
            //selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.chat_outlined,
            ),
            title: Text("Chat"),
            //selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            //selectedColor: Colors.pink,
          ),
        ],
        selectedItemColor: PrimaryRed,

      ),

    );
  }
}
