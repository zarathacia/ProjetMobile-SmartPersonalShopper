import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/Market/details.dart';

import 'item_card.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ItemCard(
            imgSrc: "images/veg_frt.png",
            title: "fruits & vegetables",
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
            imgSrc: "images/pizza.png",
            title: "Pizza",
            shopName: "Papa John's",
            press: () {},
          ),
          ItemCard(
            imgSrc: "images/safia.png",
            title: "eau",
            shopName: "MG",
            press: () {},
          )
        ],
      ),
    );
  }
}
