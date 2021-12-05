import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/home.dart';
import 'package:smart_personal_shopper/screens/profile.dart';
import 'package:smart_personal_shopper/widget/navbar.dart';
import 'package:smart_personal_shopper/widget/rating.dart';
import 'package:smart_personal_shopper/screens/Market/Market_screen.dart';

import '../models/chatUsersModel.dart';
import '../widget/conversationList.dart';
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
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                color: Colors.red[900],
                child: Column(
                  children: [
                    Text('Chats',
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.search),
                            labelText: 'Search here',
                            filled: true,
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10)
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [


                    ]),

                    ListView.builder(
                      itemCount: chatUsers.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 16),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        return ConversationList(
                          name: chatUsers[index].name,
                          messageText: chatUsers[index].messageText,
                          imageUrl: chatUsers[index].imageURL,
                          time: chatUsers[index].time,
                          rate: chatUsers[index].rate,
                          isMessageRead: (index == 0 || index == 3)?true:false,
                        );
                      },
                    ),
                    Text('More...',
                        style:
                        TextStyle(color: Colors.red.shade900, fontSize: 15)),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", imageURL: "images/user1.jpg", time: "Now",rate: 2  ),
    ChatUsers(name: "Glady's Murphy", messageText: "That's Great", imageURL: "images/user2.jpg", time: "Yesterday", rate: 1 ),
    ChatUsers(name: "Jorge Henry", messageText: "Hey where are you?", imageURL: "images/user3.jpg", time: "31 Mar",rate: 3  ),
    ChatUsers(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", imageURL: "images/user4.jpg", time: "28 Mar",rate: 4 ),
    ChatUsers(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", imageURL: "images/kim1.jpg", time: "23 Mar",rate: 5 ),
  ];
}
