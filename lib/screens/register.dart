import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/login.dart';
void main()=> runApp(MaterialApp(
  home:register(),
));
class register extends StatefulWidget{
  @override
  _register createState() => _register();}
class _register extends State<register>{
  @override
  Widget build(BuildContext context){
    return
      Stack(
        children: [
            Container(
              decoration: BoxDecoration(
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
                Center(
                  child:
                  Image(image: AssetImage('assets/images/logo.png'),width:200,height:200),
                ),
                Container(
                  height:50,
                  decoration:BoxDecoration(
                    color:Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    decoration:InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding:const EdgeInsets.symmetric(
                            horizontal: 20.0
                        ),
                        child:Icon (
                          Icons.alternate_email,
                          size: 28,
                        ),
                      ),
                      hintText: 'Email',
                    ),

                  ),

                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height:50,
                  decoration:BoxDecoration(
                    color:Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    decoration:InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding:const EdgeInsets.symmetric(
                            horizontal: 20.0
                        ),
                      ),
                      hintText: 'First Name',
                    ),

                  ),

                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height:50,
                  decoration:BoxDecoration(
                    color:Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    decoration:InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding:const EdgeInsets.symmetric(
                            horizontal: 20.0
                        ),
                      ),
                      hintText: 'Last Name',
                    ),

                  ),

                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  height:50,
                  decoration:BoxDecoration(
                    color:Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration:InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding:const EdgeInsets.symmetric(
                            horizontal: 20.0
                        ),
                        child:Icon (
                          Icons.eleven_mp_rounded,
                          size: 28,
                        ),
                      ),
                      hintText: 'Password',
                    ),

                  ),

                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  height:50,
                  decoration:BoxDecoration(
                    color:Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration:InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding:const EdgeInsets.symmetric(
                            horizontal: 20.0
                        ),
                        child:Icon (
                          Icons.eleven_mp_rounded,
                          size: 28,
                        ),
                      ),
                      hintText: 'Confirm Password',
                    ),

                  ),

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
                          child: Text(
                            'Register',
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
                      onPressed: () {  },
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
                          child: Text(
                            'Cancel',
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
