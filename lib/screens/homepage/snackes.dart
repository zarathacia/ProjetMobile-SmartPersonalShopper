import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/Market/details.dart';
import 'package:smart_personal_shopper/screens/homepage/categorielist.dart';
import 'package:smart_personal_shopper/widget/appbar.dart';
import 'package:smart_personal_shopper/widget/bottomnavbar.dart';

import 'discount_card.dart';
import 'item_card.dart';
import 'nav.dart';

class snackes extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: homeAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CategoryList(),
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
              imgSrc: "images/chips.jpg",
              title: "Chilli and lemon potato chips",
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
              imgSrc: "images/jambon.jpg",
              title: "Ham Turkey",
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
              imgSrc: "images/kaki.jpg",
              title: "Cheese and crispy cookies Snack",
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
