import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/homepage/house.dart';
import 'package:smart_personal_shopper/screens/homepage/snackes.dart';

import '../profile.dart';
import 'categorieitem.dart';
import 'groceries.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CategoryItem(
            title: "Food",
            isActive: true,
            press: () {},
          ),
          CategoryItem(
            title: "Groceries",
            isActive: true,
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => groceries()));
            },
          ),
          CategoryItem(
            title: "House materials",
            isActive: true,
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => house()));
            },
          ),
          CategoryItem(
            title: "Snacks & Sides",
            isActive: true,
            press: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => snackes()));
            },
          ),
        ],
      ),
    );
  }
}
