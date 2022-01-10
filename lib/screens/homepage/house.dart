import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/Market/details.dart';
import 'package:smart_personal_shopper/screens/homepage/categorielist.dart';
import 'package:smart_personal_shopper/widget/appbar.dart';

import 'discount_card.dart';
import 'item_card.dart';
import 'nav.dart';

class house extends StatelessWidget {


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
            house_matriel(),
            DiscountCard(),
          ],
        ),
      ),
    );
  }
}
class house_matriel extends StatelessWidget {
  const  house_matriel ({
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
              imgSrc: "images/mixeur.jpg",
              title: "120W hand mixer",
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
              imgSrc: "images/omo.jpg",
              title: "Marseille soap powder machine laundry",
              shopName: "carrefour",
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
              imgSrc: "images/robo.jpg",
              title: "Blender 1.5L",
              shopName: "carrefour",
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
