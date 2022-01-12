import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/constants.dart';

import 'package:smart_personal_shopper/screens/Payment/paycard.dart';
import 'package:smart_personal_shopper/screens/home.dart';
import 'package:smart_personal_shopper/screens/profile.dart';
import 'Productscreen.dart';
import 'Market_items.dart';
import 'package:smart_personal_shopper/screens/Market/Market_items.dart';
//import 'package:smart_personal_shopper/data/market.dart';
final _firestore=FirebaseFirestore.instance;


class marketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.primary);
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: screensize.height * 0.1,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.red,
            size: 40,
          ),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Home())),
        ),
        leadingWidth: 30,
        actions: <Widget>[
          TextButton(
            style: style,
            onPressed: () {
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyCard()));
              AwesomeDialog(
                context: context,
                headerAnimationLoop: false,
                dialogType: DialogType.NO_HEADER,
                title: 'Your have 180.52 DT',
                desc: 'Do you want to recharge your account?',
                btnCancelText: "No",
                btnOkText: "Recharge",
                btnCancelOnPress: () {},
                btnOkOnPress: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => MyCard()));
                },
                btnOkColor: SecondaryRed,
                btnCancelColor: Colors.grey[500],
              )..show();
            },
            child: const Text('Credit:180.52 DT'),
          ),
          TextButton(
              style: style,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Profile()));
              },
              child: new Container(
                width: 70.0,
                height: 45.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('images/pouya.jfif'))),
              ))
        ],
      ),
      body: Column(
        children: <Widget>[
          Text(
            'choose your market',
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 2,
              fontSize: 30,
              color: Colors.grey,
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screensize.width * 0.005,
            ),
            child: GridView.builder(
                itemCount: markets.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                      market: markets[index],
                    )),
          )),
        ],
      ),
    );
  }
}

void onTap(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => ProductScreen()));
}

class ItemCard extends StatelessWidget {
  final Market market;
  const ItemCard({
    Key,
    required this.market,
  }) : super(key: Key);

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => onTap(context),
      child: Stack(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(screensize.height * 0.005),
            child: Column(
              children: <Widget>[
                Container(
                  height: screensize.height * 0.3,
                  width: screensize.width * 0.7,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: PrimaryGrey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        market.image,
                        height: screensize.height * 0.2,
                        width: screensize.width * 0.4,
                      ),
                      Text(
                        market.title,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
