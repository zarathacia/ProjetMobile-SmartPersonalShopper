import 'package:flutter/material.dart';

import 'categorieitem.dart';

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
            press: () {},
          ),
          CategoryItem(
            title: "House materials",
            press: () {},
          ),
          CategoryItem(
            title: "Snacks & Sides",
            press: () {},
          ),
        ],
      ),
    );
  }
}
