import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/Market/details.dart';
import 'package:smart_personal_shopper/screens/homepage/categorielist.dart';
import 'package:smart_personal_shopper/widget/appbar.dart';
import 'package:smart_personal_shopper/widget/bottomnavbar.dart';

import 'discount_card.dart';
import 'item_card.dart';
import 'nav.dart';

class food extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //CategoryList(),
            snacke(),
            DiscountCard(),
          ],
        ),
      ),
    );
  }
}
class snacke extends StatelessWidget {
  const  snacke ({
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
              imgSrc: "images/hrissa.png",
              title: "hrissa",
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
              title: "pizza",
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
              imgSrc: "images/riz_blanc.png",
              title: "Riz",
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
          ],
        ),
      );
  }
}
