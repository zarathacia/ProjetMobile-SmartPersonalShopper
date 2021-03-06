import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/constants.dart';
import 'package:smart_personal_shopper/screens/chat/Chat_With_Personal_shopper.dart';
import 'package:smart_personal_shopper/screens/chat/delete_it_after/chat_screen.dart';
import 'package:smart_personal_shopper/widget/ratingstat.dart';

class ConversationList extends StatefulWidget {
  String name;
  String messageText;
  String imageUrl;
  String time;
  double rate;
  bool isMessageRead;
  ConversationList(
      {required this.name,
      required this.messageText,
      required this.imageUrl,
      required this.time,
      required this.isMessageRead,
      required this.rate});
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Chat(); //return ChatScreen();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.white,
          )),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.imageUrl),
                      maxRadius: 40,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.name,
                              style: TextStyle(fontSize: 20),
                            ),
                            ratingstat(5, widget.rate),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              widget.messageText,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                  fontWeight: widget.isMessageRead
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                widget.time,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: widget.isMessageRead
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
