import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:smart_personal_shopper/screens/List_of_Past_discussions.dart';
import 'package:smart_personal_shopper/screens/Market/Market_screen.dart';
import 'package:smart_personal_shopper/screens/home.dart';
import 'package:smart_personal_shopper/screens/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  final _pageOptions = [Home(), marketScreen(), Listof(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            title: Text("Market"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.chat_outlined,
            ),
            title: Text("Chat"),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
