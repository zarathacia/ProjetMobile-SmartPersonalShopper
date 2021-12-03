import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/login.dart';
import 'package:smart_personal_shopper/screens/register.dart';
void main()=> runApp(MaterialApp(
  home:Landing(),
));
class Landing extends StatefulWidget{
  @override
  _landing createState() => _landing();}
class _landing extends State<Landing>{
  @override
  Widget build(BuildContext context){
    return
      Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/Background.png'),
                    fit: BoxFit.cover
                )
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: <Widget>[
                const Center(
                  child:
                  Image(image: AssetImage('assets/images/logo.png'),width:200,height:200),
                ),
                const SizedBox(
                  height: 5,
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: RaisedButton(

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(200)),
                      elevation: 0.0,
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => login()));
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: <Color>[
                                Color(0xff880e4f),
                                Color(0xffb71c1c)
                              ]), //colors: <Color>[Color(0xff880e4f), Color(0xffb71c1c)])),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 300.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26.0,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: RaisedButton(

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(200)),
                      elevation: 0.0,
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => register()));
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: <Color>[
                                Color(0xffffffff),
                                Color(0xffb71c1c)
                              ]), //colors: <Color>[Color(0xff880e4f), Color(0xffb71c1c)])),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 300.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 26.0,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      )),
                ),

              ],
            ),
          ),
        ],
      );
  }
}
