import 'package:flutter/material.dart';

class Market {
  final String image, title;
  final int id;
  Market({
    required this.id,
    required this.image,
    required this.title,
  });
}

List<Market> markets = [
  Market(
      id: 1,
      title: "Magazin General",
      image: "images/profile.jpg",
),
  Market(
    id: 2,
    title: "Carfour",
    image: "images/profile.jpg",
  ),
  Market(
    id: 3,
    title: "Aziza",
    image: "images/profile.jpg",
  ),
  Market(
    id: 4,
    title: "Géant",
    image: "images/profile.jpg",
  ),
];