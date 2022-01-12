import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_personal_shopper/constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/constants.dart';
import 'package:smart_personal_shopper/screens/Payment/paycard.dart';
import 'package:smart_personal_shopper/screens/homepage/nav.dart';
import 'package:smart_personal_shopper/screens/profile.dart';

AppBar homeAppBar(BuildContext context) {
  final ButtonStyle style =
      TextButton.styleFrom(primary: Theme.of(context).colorScheme.primary);
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/logos/menu.svg"),
      onPressed: () {
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => NavBar()));
      },
    ),
    /*title: RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "Shopily",
            style: TextStyle(
              color: PrimaryRed,
            ),
          ),
        ],
      ),
    ),*/
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
  );
}
