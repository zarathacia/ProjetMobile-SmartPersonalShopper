import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_personal_shopper/provider/feedback.dart';
import 'package:smart_personal_shopper/screens/Landing/intro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => FeedbackPositionProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shopily',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: IntroScreen(),
        ),
      );
}
