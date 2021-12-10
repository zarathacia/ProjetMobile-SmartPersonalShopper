import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/widget/appbar.dart';
import 'package:smart_personal_shopper/widget/searchbar.dart';

import 'categorielist.dart';
import 'discount_card.dart';
import 'item_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SearchBox(
              onChanged: (value) {},
            ),
            CategoryList(),
            ItemList(),
            DiscountCard(),
          ],
        ),
      ),
    );
  }
}
