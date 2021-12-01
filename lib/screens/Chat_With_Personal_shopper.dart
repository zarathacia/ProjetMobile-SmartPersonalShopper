import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Container(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset(
                      'images/shopper1.png',
                      width: 150,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text('Jaki CHinj'),
                ],
              ),
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
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 100,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'You',
                                  ),
                                  SizedBox(
                                    width: 300,
                                  ),
                                  Text('18.52'),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 50,
                                width: 300,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesettingindustry. '),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text('Jakki'),
                                  SizedBox(
                                    width: 300,
                                  ),
                                  Text('18.52'),
                                ],
                              ),
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.asset(
                                      'images/shopper1.png',
                                      width: 60,
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.blue,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                          'Lorem Ipsum is simply dummy text of the printing and typesettingindustry. '),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text('You'),
                                  SizedBox(
                                    width: 300,
                                  ),
                                  Text('18.52'),
                                ],
                              ),
                              Container(
                                height: 50,
                                width: 300,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                      'Lorem Ipsum is simply dummy text of the printing and typesettingindustry. '),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ]),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                    child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.add_circle_outline_outlined),
                    Expanded(
                      child: Text('Type here .... '),
                    ),
                    Icon((Icons.mic_outlined)),
                    Icon(Icons.emoji_emotions_outlined),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                )),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
