import 'dart:html';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/Market/Market_items.dart';
import 'package:smart_personal_shopper/screens/home_screen.dart';
import '../List_of_Past_discussions.dart';
import '../Productscreen.dart';
import '../profile.dart';
import 'Market_items.dart';


class marketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            style: style,
            onPressed: () {},
            child: const Text('Credit 180.52£'),
          ),
          TextButton(
              style: style,
              onPressed: () {},
              child: new Container(
                width:90.0,
                height:90.0,
                decoration: new BoxDecoration(
                    shape:BoxShape.circle,
                    image: new DecorationImage(
                        fit : BoxFit.fill,
                        image: AssetImage('images/profile.jpg'))
                ),
              )
          )
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
                onPressed: () {Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));},
              ),
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homeinterface()));
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.chat_outlined,
                  color: Colors.black,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Listof()));
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
      body:Column(
          children: <Widget>[
            Text(
              'choose your market',
              textAlign: TextAlign.center,
              style: TextStyle(height: 2, fontSize: 30, color:Colors.grey,),

            ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: GridView.builder(
              itemCount: markets.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(
                market: markets[index],
                    )),
              )),
    ],
      ),
    );
  }
}
    class ItemCard extends StatelessWidget {
    final Market market;
    const ItemCard({
    Key ,
    required this.market,

    }) : super(key: Key);

    @override
    Widget build(BuildContext context) {
    return Container(
          padding:EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Container(
                padding:EdgeInsets.all(6),
                height:250,
                width:250,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius : BorderRadius.circular(16),
                ),
                child:Column(
                  children: <Widget>[
                    Image.asset(market.image),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: () {Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ProductScreen())); },
                      child: Text(market.title,
                        style: TextStyle(fontSize: 15),
                      ),
                    )

                  ],
                ),
              ),

            ],

          ),
    );
  }
}