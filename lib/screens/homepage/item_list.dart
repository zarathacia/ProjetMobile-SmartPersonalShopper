import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/details.dart';

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
            svgSrc: "assets/icons/burger_beer.svg",
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
            svgSrc: "assets/logos/chinese_noodles.svg",
            title: "Pizza",
            shopName: "Papa Jones",
            press: () {},
          ),
          ItemCard(
            svgSrc: "assets/logos/burger_beer.svg",
            title: "eau",
            shopName: "Aziza",
            press: () {},
          )
        ],
      ),
    );
  }
}
