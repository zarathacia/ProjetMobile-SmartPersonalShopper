import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget ratingstat(double _ratingValue ,double X){
  return RatingBar(
      initialRating: X,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 0),
      ratingWidget: RatingWidget(
          full: SizedBox(
              height: 5,
              width: 5,
              child: const Icon(Icons.star, color: Colors.blue,size: 3)),
          half:SizedBox(
              height: 5,
              width: 5,
              child: const Icon(Icons.star_half, color: Colors.blue, size: 3,)),
          empty:SizedBox(
              height: 5,
              width: 5,
              child: const Icon(Icons.star_outline, color: Colors.blue, size: 3,))
      ),
      onRatingUpdate: (X) {
      }
      );
}