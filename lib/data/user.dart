import 'package:flutter/cupertino.dart';

class User {
  final String name;
  final String rating;

  final int age;
  final String imgUrl;
  final String location;
  final String bio;
  bool isLiked;
  bool isSwipedOff;

  User({
    required this.rating,
    required this.name,
    required this.age,
    required this.imgUrl,
    required this.location,
    required this.bio,
    this.isLiked = false,
    this.isSwipedOff = false,
  });

  User.fromJson(Map<String, Object?> json)
      : this(
      rating:json['rating']! as String,
      name: json['name']! as String,
      age: json['age']! as int,
      imgUrl: json['imgUrl']! as String,
      location: json['location']! as String,
      bio: json['bio']! as String

  );

  Map<String, Object?> toJson() {
    return {
      'rating':rating,
      'name': name,
      'bio':bio,
      'imgUrl':imgUrl,
      'age':age,
      'location':location,
    };

}
}
