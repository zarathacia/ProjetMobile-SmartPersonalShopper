import 'package:flutter/material.dart';
import '../widget/button.dart' show buttonCustome;
import 'home.dart';
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
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                height:70,
                decoration:BoxDecoration(
                  color:Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration:InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding:EdgeInsets.symmetric(
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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: RaisedButton(

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(200)),
                    elevation: 0.0,
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const Home()));
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

            ],
    ),
    ),
    ],
    );
  }
}
