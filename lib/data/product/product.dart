
import 'package:flutter/widgets.dart';

@immutable
class Product {
  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.review,
    required this.image
  });
  final String name;
  final String description;
  final String image;
  final String price;
  final String review;
  Product.fromJson(Map<String, Object?> json)
      : this(
      name: json['name']! as String,
      description: json['description']! as String,
      image: json['image']! as String,
      price: json['price']! as String,
      review: json['review']! as String
  );




  Map<String, Object?> toJson() {
    return {
      'name': name,
      'description':description,
      'image':image,
      'price':price,
      'review':review,
    };
  }
}