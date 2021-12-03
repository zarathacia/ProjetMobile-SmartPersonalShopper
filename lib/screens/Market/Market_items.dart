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
      image: "images/mg.jpg",
),
  Market(
    id: 2,
    title: "Carrefour",
    image: "images/carrefour.png",
  ),
  Market(
    id: 3,
    title: "Aziza",
    image: "images/aziza.jfif",
  ),
  Market(
    id: 4,
    title: "Géant",
    image: "images/geant.jpg",
  ),
];