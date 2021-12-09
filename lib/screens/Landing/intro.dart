import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_personal_shopper/screens/Landing/landingscreen.dart';
import 'package:smart_personal_shopper/screens/home.dart';
import 'package:smart_personal_shopper/screens/login_registration/login.dart';

import '../../constants.dart';
import '../login_registration/register.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }
  Widget _indicator(bool isActive) {

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xffb89686),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screensize=MediaQuery.of(context).size;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background1.png"), fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: screensize.width*0.09),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xffb89686),
                        fontSize:  screensize.width*0.06,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: screensize.height*0.7,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all( screensize.width*0.12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'images/ic_launcher.png',
                                ),
                                height: screensize.height*0.3,
                                width: screensize.width*0.8,
                              ),
                            ),
                            SizedBox(height:  screensize.width*0.09),
                            Text(
                              'Connect people\naround the world',
                              style: TextStyle(
                              fontSize:screensize.width*0.06,
                              fontWeight: FontWeight.bold,
                                color: Color(0xffb89686),
                            ),),
                            SizedBox(height:  screensize.width*0.09),
                            Text(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: TextStyle(
                                fontSize: screensize.width*0.04,
                                color: Color(0xffb89686),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all( screensize.width*0.12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'images/deliv4.png',
                                ),
                                height: screensize.height*0.3,
                                width: screensize.width*0.8,
                              ),
                            ),
                            SizedBox(height:  screensize.width*0.09),
                            Text(
                              'Live your life smarter\nwith us!',
                              style: TextStyle(
                                fontSize:  screensize.width*0.06,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffb89686),
                              ),
                            ),
                            SizedBox(height:  screensize.width*0.09),
                            Text(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: TextStyle(
                                fontSize: screensize.width*0.04,
                                color: Color(0xffb89686),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screensize.width*0.12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'images/deliv1.png',
                                ),
                                height: screensize.height*0.3,
                                width: screensize.width*0.8,
                              ),
                            ),
                            SizedBox(height: screensize.height*0.01),
                            Text(
                              'Get a new experience\nof imagination',
                              style: TextStyle(
                                fontSize: screensize.width*0.06,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffb89686),
                              ),
                            ),
                            SizedBox(height: screensize.height*0.01),
                            Text(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              style: TextStyle(
                                fontSize: screensize.width*0.04,
                                color: Color(0xffb89686),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Color(0xffb89686),
                                    fontSize: screensize.width*0.06,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color:  Color(0xffb89686),
                                  size: screensize.width*0.09,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height:screensize.height*0.05,
              width: screensize.width,
              color: Colors.transparent,
              child: GestureDetector(
                child: Center(
                  child: SizedBox(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screensize.width*0.05)),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      "Buy  Now".toUpperCase(),
                      style: TextStyle(
                        fontSize: screensize.width*0.04,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffb89686),

                      ),
                    ),
                  ),
                ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
