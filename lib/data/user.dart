import 'package:flutter/cupertino.dart';

class User {
  final String name;
  final String designation;

  final int age;
  final String imgUrl;
  final String location;
  final String bio;
  bool isLiked;
  bool isSwipedOff;

  User({
    @required this.designation = 't',
    @required this.name = 't',
    @required this.age = 18,
    @required this.imgUrl = 'x',
    @required this.location = 'a',
    @required this.bio = 'b',
    this.isLiked = false,
    this.isSwipedOff = false,
  });
}
