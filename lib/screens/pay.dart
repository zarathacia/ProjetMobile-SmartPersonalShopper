import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/constants.dart';
import 'home.dart';
import 'profile.dart';

class Pay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height; //responsive sized
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent, //Color(0xff880e4f)
        elevation: 0.0,

        leading: new IconButton(
          icon: new Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        leadingWidth: 60,
      ),
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                width: width * 0.6,
                height: height * 0.3,
                child: Image.asset(
                  'images/ic_launcher.png',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.15,
                    ),
                    Text(
                      'Total ',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[900],
                      ),
                    ),
                    Text(
                      ' 15.25 Dt',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Card number',
                  suffixIcon: Icon(Icons.payment),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    elevation: 5.0,
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: <Color>[
                              Color(0xff880e4f),
                              Color(0xffb71c1c)
                            ]), //colors: <Color>[Color(0xff880e4f), Color(0xffb71c1c)])),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 150.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Pay",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    )),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Text('payment done')));
                },
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: 'Privacy policy',
                      style: TextStyle(color: Colors.red[900]),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
