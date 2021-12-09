import 'package:flutter/material.dart';

class Product {
  final String image, title, descreption;
  final int id;
  final double price;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.descreption,
    required this .price
  });
}

List<Product> products = [
  Product(
    id: 0,
    title: "Hrissa sicam",
    image: "images/hrissa.jpg",
    descreption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor posuere eleifend. Etiam ut imperdiet odio, id euismod nisi. Nunc vulputate quis orci id luctus. Nulla facilisi. Vestibulum vulputate laoreet massa, vitae tempus nulla iaculis nec. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
    price: 0.850
  ),
  Product(
      id: 1,
      title: "Pizza",
      image: "images/pizza.png",
      descreption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor posuere eleifend. Etiam ut imperdiet odio, id euismod nisi. Nunc vulputate quis orci id luctus. Nulla facilisi. Vestibulum vulputate laoreet massa, vitae tempus nulla iaculis nec. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
      price: 20.850
  ),
  Product(
      id: 2,
      title: "Boga",
      image: "images/boga1.jpg",
      descreption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor posuere eleifend. Etiam ut imperdiet odio, id euismod nisi. Nunc vulputate quis orci id luctus. Nulla facilisi. Vestibulum vulputate laoreet massa, vitae tempus nulla iaculis nec. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
      price: 2.850
  ),
  Product(
      id: 3,
      title: "Tomates",
      image: "images/tomate.jpg",
      descreption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor posuere eleifend. Etiam ut imperdiet odio, id euismod nisi. Nunc vulputate quis orci id luctus. Nulla facilisi. Vestibulum vulputate laoreet massa, vitae tempus nulla iaculis nec. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
      price: 1.850
  ),
  Product(
      id: 4,
      title: "Hrissa sicam",
      image: "images/hrissa.jpg",
      descreption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor posuere eleifend. Etiam ut imperdiet odio, id euismod nisi. Nunc vulputate quis orci id luctus. Nulla facilisi. Vestibulum vulputate laoreet massa, vitae tempus nulla iaculis nec. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
      price: 0.850
  ),
  Product(
      id: 5,
      title: "Pizza",
      image: "images/pizza.png",
      descreption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor posuere eleifend. Etiam ut imperdiet odio, id euismod nisi. Nunc vulputate quis orci id luctus. Nulla facilisi. Vestibulum vulputate laoreet massa, vitae tempus nulla iaculis nec. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
      price: 20.850
  ),
  Product(
      id: 6,
      title: "Boga",
      image: "images/boga1.jpg",
      descreption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor posuere eleifend. Etiam ut imperdiet odio, id euismod nisi. Nunc vulputate quis orci id luctus. Nulla facilisi. Vestibulum vulputate laoreet massa, vitae tempus nulla iaculis nec. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
      price: 2.850
  ),
  Product(
      id: 7,
      title: "Tomates",
      image: "images/tomate.jpg",
      descreption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor posuere eleifend. Etiam ut imperdiet odio, id euismod nisi. Nunc vulputate quis orci id luctus. Nulla facilisi. Vestibulum vulputate laoreet massa, vitae tempus nulla iaculis nec. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
      price: 1.850
  ),
];