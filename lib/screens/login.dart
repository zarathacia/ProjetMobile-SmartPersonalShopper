import 'package:flutter/material.dart';
void main()=> runApp(MaterialApp(
  home:login(),
));
class login extends StatefulWidget{
  @override
  _login createState() => _login();}
class _login extends State<login>{
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
              Image(image: AssetImage('assets/images/logo.png'),width:300,height:300),
              ),
              Container(
                height:70,
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
              Container(
                padding: EdgeInsets.all(16),
                height:70,
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
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () { },
                child: Text('TextButton'),
              )

            ],
    ),
    ),
    ],
    );
  }
}
