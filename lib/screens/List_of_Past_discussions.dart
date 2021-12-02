import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/home.dart';
import 'package:smart_personal_shopper/screens/profile.dart';
import 'package:smart_personal_shopper/widget/navbar.dart';
import 'package:smart_personal_shopper/widget/rating.dart';
import 'package:smart_personal_shopper/screens/Market/Market_screen.dart';


import 'Chat_With_Personal_shopper.dart';

class Listof extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'chat list',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: Column (
              children: [
                Container(
                  color: Colors.red[900],
                  child:
                  Column(
                    children: [
                      Text('Chats',style :TextStyle(color:Colors.white,fontSize :30)),
                      Container(
                        child:
                        Padding(padding:EdgeInsets.all(8.0),
                        child:
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.search),
                            labelText: 'Search here',
                            filled: true,
                            fillColor: Colors.white ,

                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),

                          ),),
                      ),
                      ),
                      SizedBox(height:10)


                    ],
                  ),
                ),
                Container(
                  height: size.height*0.7 ,
                  width: size.width*0.9,
                  child: Column(
                  children: [

                    SizedBox(
                      height: 50,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red.shade900,
                          ),
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      child:
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.red.shade900,
                                        ),
                                        borderRadius: BorderRadius.circular(0.0),
                                      ),
                                      child:
                                      Container(
                                        width: size.width*0.8,
                                        child: Row(
                                          children: [
                                              Container(
                                                child:
                                                  ClipRRect(
                                                 borderRadius: BorderRadius.circular(100.0),
                                                child:
                                                Image.asset(
                                                  'images/user1.jpg',
                                                  width: 60,
                                                ),
                                              ),
                                            ),


                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text('Lauren Turner',textAlign: TextAlign.left,style: TextStyle(fontSize: 20,color:Colors.red.shade900,fontWeight:FontWeight.bold)),
                                                    SizedBox(width: 50,),
                                                    Text('12.25')
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(Icons.star, color: Colors.blue,size: 30),
                                                    const Icon(Icons.star, color: Colors.blue,size: 30),
                                                    const Icon(Icons.star_outline, color: Colors.blue,size: 30),
                                                    const Icon(Icons.star_outline, color: Colors.blue, size: 30,),
                                                    const Icon(Icons.star_outline, color: Colors.blue, size: 30,),

                                                  ],
                                                ),
                                                Text('Lorem Ipsum is simply dummy .')
                                              ],
                                            )
                                          ],
                                        ),
                                      ),

                                      ),
                                        onTap:(){
                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (context) => Chat()));
                                        }
                                    ),
                                    InkWell(
                                        child:
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.red.shade900,
                                            ),
                                            borderRadius: BorderRadius.circular(0.0),
                                          ),
                                          child:
                                          Container(
                                            width: size.width*0.8,
                                            child: Row(
                                              children: [
                                                Container(
                                                  child:
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(100.0),
                                                    child:
                                                    Image.asset(
                                                      'images/user4.jpg',
                                                      width: 60,
                                                    ),
                                                  ),
                                                ),


                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text('Lori Perez',style: TextStyle(fontSize: 20,color:Colors.red.shade900,fontWeight:FontWeight.bold)),
                                                        SizedBox(width: 100,),
                                                        Text('12.25')
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(Icons.star, color: Colors.blue,size: 30),
                                                        const Icon(Icons.star, color: Colors.blue,size: 30),
                                                        const Icon(Icons.star_outline, color: Colors.blue,size: 30),
                                                        const Icon(Icons.star_outline, color: Colors.blue, size: 30,),
                                                        const Icon(Icons.star_outline, color: Colors.blue, size: 30,),

                                                      ],
                                                    ),
                                                    Text('Lorem Ipsum is simply dummy .')
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),

                                        ),
                                        onTap:(){
                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (context) => Chat()));
                                        }
                                    ),
                                    InkWell(
                                        child:
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.red.shade900,
                                            ),
                                            borderRadius: BorderRadius.circular(0.0),
                                          ),
                                          child:
                                          Container(
                                            width: size.width*0.8,

                                            child: Row(
                                              children: [
                                                Container(
                                                  child:
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(100.0),
                                                    child:
                                                    Image.asset('images/kim1.jpg', width: 60,height: 60,),
                                                  ),
                                                ),


                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text('Kim Wexler',style: TextStyle(fontSize: 20,color:Colors.red.shade900,fontWeight:FontWeight.bold)),
                                                        SizedBox(width: 100,),
                                                        Text('12.25')
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(Icons.star, color: Colors.blue,size: 30),
                                                        const Icon(Icons.star, color: Colors.blue,size: 30),
                                                        const Icon(Icons.star_outline, color: Colors.blue,size: 30),
                                                        const Icon(Icons.star_outline, color: Colors.blue, size: 30,),
                                                        const Icon(Icons.star_outline, color: Colors.blue, size: 30,),

                                                      ],
                                                    ),
                                                    Text('Lorem Ipsum is simply dumy .')
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),

                                        ),
                                        onTap:(){
                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (context) => Chat()));
                                        }
                                    ),
                                    InkWell(
                                        child:
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.red.shade900,
                                            ),
                                            borderRadius: BorderRadius.circular(0.0),
                                          ),
                                          child:
                                          Container(
                                            width: size.width*0.8,

                                            child: Row(
                                              children: [
                                                Container(
                                                  child:
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(100.0),
                                                    child:
                                                    Image.asset(
                                                      'images/profile.jpg',
                                                      width: 60,
                                                    ),
                                                  ),
                                                ),


                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text('Maria bria',style: TextStyle(fontSize: 20,color:Colors.red.shade900,fontWeight:FontWeight.bold)),
                                                        SizedBox(width: 100,),
                                                        Text('12.25')
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(Icons.star, color: Colors.blue,size: 30),
                                                        const Icon(Icons.star, color: Colors.blue,size: 30),
                                                        const Icon(Icons.star_outline, color: Colors.blue,size: 30),
                                                        const Icon(Icons.star_outline, color: Colors.blue, size: 30,),
                                                        const Icon(Icons.star_outline, color: Colors.blue, size: 30,),

                                                      ],
                                                    ),
                                                    Text('Lorem Ipsum is simply dummy .')
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),

                                        ),
                                        onTap:(){
                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (context) => Chat()));
                                        }
                                    ),
                                    InkWell(
                                        child:
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.red.shade900,
                                            ),
                                            borderRadius: BorderRadius.circular(0.0),
                                          ),
                                          child:
                                          Container(
                                            width: size.width*0.8,

                                            child: Row(
                                              children: [
                                                Container(
                                                  child:
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(100.0),
                                                    child:
                                                    Image.asset(
                                                      'images/shopper1.png',
                                                      width: 60,
                                                    ),
                                                  ),
                                                ),


                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text('Jaki chong',textAlign: TextAlign.left ,style: TextStyle(fontSize: 20,color:Colors.red.shade900,fontWeight:FontWeight.bold)),
                                                        SizedBox(width: 100,),
                                                        Text('12.25', textAlign: TextAlign.left)
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(Icons.star, color: Colors.blue,size: 30),
                                                        const Icon(Icons.star, color: Colors.blue,size: 30),
                                                        const Icon(Icons.star_outline, color: Colors.blue,size: 30),
                                                        const Icon(Icons.star_outline, color: Colors.blue, size: 30,),
                                                        const Icon(Icons.star_outline, color: Colors.blue, size: 30,),

                                                      ],
                                                    ),
                                                    Text('Lorem Ipsum is simply dummy .')
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),

                                        ),
                                        onTap:(){
                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (context) => Chat()));
                                        }
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),





                    ]),
                    Text('More...',style: TextStyle(color:Colors.red.shade900 , fontSize: 15)),

                  ],
              ),
                )]
          ),
        ),
        bottomNavigationBar:
        navbar(Home(), marketScreen(), Listof(), Profile(), context),
      ),
    );
  }
}