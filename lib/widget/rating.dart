import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget rating(double _ratingValue ){
  return RatingBar(
      initialRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      ratingWidget: RatingWidget(
          full: const Icon(Icons.star, color: Colors.blue,size: 10),
          half:const Icon(Icons.star_half, color: Colors.blue, size: 10,),
          empty:const Icon(Icons.star_outline, color: Colors.blue, size: 10,)
      ),
      onRatingUpdate: (value) {
        _ratingValue = value;
      });
}