import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/Market/details.dart';
import 'package:smart_personal_shopper/screens/homepage/categorielist.dart';
import 'package:smart_personal_shopper/widget/appbar.dart';

import 'discount_card.dart';
import 'item_card.dart';
import 'nav.dart';

class groceries extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            grocerie(),
            DiscountCard(),
          ],
        ),
      ),
    );
  }
}
class grocerie extends StatelessWidget {
    const grocerie({
    Key? key,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
    return

    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ItemCard(
            imgSrc: "images/papier.jpg",
            title: "Deluxe 2-ply napkins 30x30cm",
            shopName: "Carrefour",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return details();
                  },
                ),
              );
            },
          ),
          ItemCard(
            imgSrc: "images/alu.jpg",
            title: "Aluminum container 160x160cm",
            shopName: "Carrefour",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return details();
                  },
                ),
              );
            },
          ),
          ItemCard(
            imgSrc: "images/sahet.jpg",
            title: "Ice cube bags",
            shopName: "carrefour",
            press: () {          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return details();
                },
              ),
            );
            },
          ),
        ],
      ),
    );
  }
}
