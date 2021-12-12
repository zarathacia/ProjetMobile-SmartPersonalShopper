import 'package:flutter/material.dart';

final PrimaryRed = Colors.red.shade900;
final PrimaryGrey = Colors.grey.shade900;
const SecondaryRed=Color(0xffc9184a);
const PrimaryDarkRed = Color(0xFF8a1e1f);
const PrimaryDarkGray = Color(0xff494042);
const PrimaryPurpleGray = Color(0xFF7a6d7d);
const PrimaryLightColor = Color(0xFFFFFFFF);

final kHintTextStyle = TextStyle(
  color: Colors.grey[900],
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.grey[900],
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFfff0f3),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
final kTitleStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'CM Sans Serif',
  fontSize: 26.0,
  height: 1.5,
);

final kSubtitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  height: 1.2,
);
