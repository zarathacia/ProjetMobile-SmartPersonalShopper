import 'dart:convert';
import 'package:flutter/widgets.dart';

class CartItem {

  final String id;
  final String name;
  final int quantity;
  final double price;
  final String image;
  final String datetime;

  CartItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
    required this.datetime
  });

  factory CartItem.fromJson(Map<String, dynamic> json){
      return CartItem(
    id:json['id']! as String,
    name: json['name']! as String,
    image: json['image']! as String,
    price: json['price']! as double,
    quantity: json['qty']! as int,
    datetime: json['datetime']! as String,
  );
  }
  Map<String, Object?> toJson() {
    return {
      'id':id,
      'name': name,
      'quantity':quantity,
      'price':price
    };
  }
}

  class Cart{
    Map<String,CartItem> items={};
    Cart({required this.items});

    Cart.fromJson(Map<String, Object?> json)
        : this(
        items:json['cart-items']! as Map<String,CartItem>,
    );

    Map<String, Object?> toJson() {
      return {
        'cart-items':items,
      };
    }


  }

/*Cart.fromJson(Map<String, Object?> json)
      : this(
      id: json['id']! as String,
      time: json['time']! as String,

  );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'time':time,
    };
  }*/

