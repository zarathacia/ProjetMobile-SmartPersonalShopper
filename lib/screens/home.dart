import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/Market/Market_screen.dart';
import 'package:smart_personal_shopper/widget/button.dart';
import 'Confirm_receival.dart';
import 'List_of_Past_discussions.dart';
import 'choose_your_personal_shopper.dart';
import 'profile.dart';
import 'pay.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text("Shopily",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25,
            )),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: 50,
        ),
        actions: [
          Container(
            width: 80,
            child: IconButton(
              alignment: Alignment.center,
              icon: const Icon(
                Icons.account_circle_rounded,
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
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => marketScreen()));
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.chat_outlined,
                  color: Colors.black,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Listof()));
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 15),
              ),
              SizedBox(
                height: 100,
              ),
              Text("Welcome message",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
          ),
          SizedBox(
            height: 100,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
            color: Colors.red,
            child: Text(
              'go to profile',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Pay()));
            },
            color: Colors.red,
            child: Text(
              'go to pay',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Choose()));
            },
            color: Colors.red,
            child: Text(
              'choose your delivrer',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Confirm()));
            },
            color: Colors.red,
            child: Text(
              'Rate',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),

        ],
      )),
    );
  }
}
