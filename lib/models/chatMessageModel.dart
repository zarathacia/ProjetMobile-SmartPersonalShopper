import 'package:flutter/cupertino.dart';

class ChatMessage{
  String messageContent;
  String messageType;
  String time;
  ChatMessage({required this.messageContent,required this.time ,required this.messageType});
}