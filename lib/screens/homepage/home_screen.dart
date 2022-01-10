import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/homepage/nav.dart';
import 'package:smart_personal_shopper/widget/appbar.dart';

import 'categorielist.dart';
import 'discount_card.dart';
import 'item_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() =>  HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: homeAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CategoryList(),
            ItemList(),
            DiscountCard(),
          ],
        ),
      ),
    );
  }
}
