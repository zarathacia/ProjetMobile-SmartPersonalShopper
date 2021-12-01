import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smart_personal_shopper/widgets/rating.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late double _ratingValue;


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
          leading: Icon(Icons.arrow_back),
          backgroundColor: Colors.red ,
          centerTitle: true,
          title: Text('Sign Up',
            style: TextStyle(fontSize: 40),)
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Confirm receival of goods', style: TextStyle(color: Colors.grey,fontSize: 20),),
            RaisedButton(onPressed: (){},child: Text('Confirm receipt'),color: Colors.red,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)) ),
            ///Image.asset('images/ic_launcher.png',width: 220),
            SizedBox(height: 200,),
            Text('Review personal shopper',style: TextStyle(fontSize: 20),),
            SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Column(
                  children: [
                    Container(
                      child:
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.asset('images/shopper1.png' ,width: 150,),
                      ),
                    ),
                    Text('Jakie chong'),
                  ],
                ),
                SizedBox(width: 100,),
                Column(
                  children: [
                    Text('rate execution'),

                    RatingBar(
                        initialRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                            full: Icon(Icons.star, color: Colors.blue,size: 10),
                            half: Icon(Icons.star_half, color: Colors.blue, size: 10,),
                            empty: Icon(Icons.star_outline, color: Colors.blue, size: 10,)
                        ),
                        onRatingUpdate: (value) {
                          setState(() {
                            _ratingValue = value;
                          });
                        }),
                    SizedBox(height: 20,),
                    Text('rate behaviour'),
                    RatingBar(
                        initialRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                            full: Icon(Icons.star, color: Colors.blue,size: 10),
                            half: Icon(Icons.star_half, color: Colors.blue, size: 10,),
                            empty: Icon(Icons.star_outline, color: Colors.blue, size: 10,)
                        ),
                        onRatingUpdate: (value) {
                          _ratingValue = value;
                        }),
                    SizedBox(height: 20,),
                    Text('rate quality of goods'),
                    RatingBar(
                        initialRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                            full: Icon(Icons.star, color: Colors.blue,size: 10),
                            half: Icon(Icons.star_half, color: Colors.blue, size: 10,),
                            empty: Icon(Icons.star_outline, color: Colors.blue, size: 10,)
                        ),
                        onRatingUpdate: (value) {
                          _ratingValue = value;
                        }),
                  ],


                ),
              ],
            ),


          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('_ratingValue', _ratingValue));
  }
}
