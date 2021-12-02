import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/widget/rating.dart';

class Listof extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'chat list',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          shadowColor: Colors.red,
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
                  color: Colors.red,
                  child:
                  Column(
                    children: [
                      Text('Chats',style :TextStyle(color:Colors.white,fontSize :30)),
                      Container(
                        child:
                        Padding(padding:EdgeInsets.all(8.0),
                        child:
                        TextFormField(
                          decoration: const InputDecoration(
                            fillColor: Colors.white ,
                            icon: Icon(Icons.search),
                            labelText: 'Search here',
                          ),),
                      ),
                      ),


                    ],
                  ),
                ),
                Column(
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
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child:
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(100.0),
                                          child: Image.asset(
                                            'images/shopper1.png',
                                            width: 60,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text('Jaki chong',style: TextStyle(fontSize: 20,color:Colors.red,fontWeight:FontWeight.bold)),
                                                SizedBox(width: 250,),
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
                                            Text('Lorem Ipsum is simply dummy text of the printing and typesettingindustry.')
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child:
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(100.0),
                                          child: Image.asset(
                                            'images/shopper1.png',
                                            width: 60,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text('Jaki chong',style: TextStyle(fontSize: 20,color:Colors.red,fontWeight:FontWeight.bold)),
                                                SizedBox(width: 250,),
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
                                            Text('Lorem Ipsum is simply dummy text of the printing and typesettingindustry.')
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child:
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(100.0),
                                          child: Image.asset(
                                            'images/shopper1.png',
                                            width: 60,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text('Jaki chong',style: TextStyle(fontSize: 20,color:Colors.red,fontWeight:FontWeight.bold)),
                                                SizedBox(width: 250,),
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
                                            Text('Lorem Ipsum is simply dummy text of the printing and typesettingindustry.')
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child:
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(100.0),
                                          child: Image.asset(
                                            'images/shopper1.png',
                                            width: 60,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text('Jaki chong',style: TextStyle(fontSize: 20,color:Colors.red,fontWeight:FontWeight.bold)),
                                                SizedBox(width: 250,),
                                                Text('12.25')
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.star, color: Colors.blue,size: 30),
                                                const Icon(Icons.star, color: Colors.blue,size: 30),
                                                const Icon(Icons.star, color: Colors.blue,size: 30),
                                                const Icon(Icons.star, color: Colors.blue, size: 30,),
                                                const Icon(Icons.star_outline, color: Colors.blue, size: 30,),

                                              ],
                                            ),
                                            Text('Lorem Ipsum is simply dummy text of the printing and typesettingindustry.')
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child:
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(100.0),
                                          child: Image.asset(
                                            'images/shopper1.png',
                                            width: 60,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text('Jaki chong',style: TextStyle(fontSize: 20,color:Colors.red,fontWeight:FontWeight.bold)),
                                                SizedBox(width: 250,),
                                                Text('12.25')
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.star, color: Colors.blue,size: 30),
                                                const Icon(Icons.star, color: Colors.blue,size: 30),
                                                const Icon(Icons.star, color: Colors.blue,size: 30),
                                                const Icon(Icons.star_outline, color: Colors.blue, size: 30,),
                                                const Icon(Icons.star_outline, color: Colors.blue, size: 30,),

                                              ],
                                            ),
                                            Text('Lorem Ipsum is simply dummy text of the printing and typesettingindustry.')
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ]),

                ],
              )]
          ),
        ),
      ),
    );
  }
}