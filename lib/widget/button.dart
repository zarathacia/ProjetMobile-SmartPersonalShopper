import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget buttonCustome(String txt, Widget page, context) {
  return RaisedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return page;
        }));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      elevation: 0.0,
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: <Color>[
                Color(0xff880e4f),
                Color(0xffb71c1c)
              ]), //colors: <Color>[Color(0xff880e4f), Color(0xffb71c1c)])),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: const Text(
            "Edit profile",
            style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.w300),
          ),
        ),
      ));
}
