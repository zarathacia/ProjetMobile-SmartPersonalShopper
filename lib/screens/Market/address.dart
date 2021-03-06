import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/constants.dart';
import 'package:smart_personal_shopper/data/user.dart';

import 'checkout.dart';
//import 'checkout_screen.dart';

class Address extends StatefulWidget {
  User chosenUser= User(
      rating: "",
      name: "", age: 0, imgUrl: "", location: "", bio: "");
  @override
  State<StatefulWidget> createState() => LunchState();

  Address({required this.chosenUser});
}

class LunchState extends State<Address> {
  String address="";
  final nameController = TextEditingController();
  final lineController = TextEditingController();
  final cityController = TextEditingController();
  final postalController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Address",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: initScreen(),
      ),
    );
  }

  Widget initScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // NameEdit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: "Name", // Set text upper animation
              border: OutlineInputBorder(),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.text,
          ),
        ),

        // Address Line Edit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: lineController,
            decoration: InputDecoration(
                labelText: "Address Line", border: OutlineInputBorder()),
            minLines: 1,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
          ),
        ),

        // City Edit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: cityController,
            decoration: InputDecoration(
              labelText: "City", // Set text upper animation
              border: OutlineInputBorder(),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.text,
          ),
        ),

        // Postal Code Edit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: postalController,
            decoration: InputDecoration(
              labelText: "Postal Code", // Set text upper animation
              border: OutlineInputBorder(),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.number,
          ),
        ),

        // Phone Number Edit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: phoneController,
            decoration: InputDecoration(
              labelText: "Phone Number", // Set text upper animation
              border: OutlineInputBorder(),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.number,
          ),
        ),

        // Login Button
        Center(
            child: Container(
                margin: EdgeInsets.only(top: 50.0, bottom: 10.0),
                child: RaisedButton(
                  onPressed: () {
                    address=lineController.text+" , "+
                            cityController.text+" , "+
                            postalController.text;
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Checkout(
                            chosenUser:widget.chosenUser,
                            address: address
                        )));
                  }, // Click Listener

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [PrimaryRed, SecondaryRed],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Container(
                      constraints: const BoxConstraints(
                          maxWidth: 300.0,
                          minHeight: 40.0), // min sizes for Material buttons
                      alignment: Alignment.center,
                      child: const Text(
                        'Add Address',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ))),
      ],
    );
  }
}
