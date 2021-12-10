import 'package:flutter/material.dart';

import 'package:smart_personal_shopper/constants.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback press;
  const CategoryItem({
    Key? key,
    required this.title,
    this.isActive = false,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: isActive
                  ? TextStyle(
                      color: PrimaryRed,
                      fontWeight: FontWeight.bold,
                    )
                  : TextStyle(fontSize: 12),
            ),
            if (isActive)
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 3,
                width: 22,
                decoration: BoxDecoration(
                  color: PrimaryRed,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
