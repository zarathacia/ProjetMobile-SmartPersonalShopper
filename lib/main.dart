import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_personal_shopper/provider/feedback.dart';
import 'package:smart_personal_shopper/screens/Landing/intro.dart';
import 'package:firebase_core/firebase_core.dart';





void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyC3W65nvgDJ9vFp7OvVXtZ6z5H7dbhDuq8",
          appId: "1:77933949881:android:6daa0a272a99951872fc68",
          messagingSenderId: "77933949881-se63i1vdgj2s6kou02ug9rb6jrccd37u.apps.googleusercontent.com",
          projectId: "shopili-mobile-project",
          ));
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
