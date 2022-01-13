import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_personal_shopper/constants.dart';
import 'package:smart_personal_shopper/screens/settings.dart';

import '../../widget/theme_helper.dart';

class EditProfile extends StatefulWidget {
  final String currentUserId = '';
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  User? user = FirebaseAuth.instance.currentUser;
  String _userID = "";
  String _email ="";
  String _fname = "";
  String _lname = "";
  String _password = "";
  String _location ="";
  String _credit="";
  String _phonenumber ="";
  String _imageurl="";
  String _newemail ="";
  String _newfname = "";
  String _newlname = "";
  String _newpassword = "";
  String _newlocation ="";
  String _newcredit="";
  String _newphonenumber ="";


  void getData() async {
    _userID = user!.uid;
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('userdata').doc(_userID).get();
    setState(() {
      _fname = userDoc.get('first name');
      _lname = userDoc.get('last name');
      _email = userDoc.get('email');
      _location = userDoc.get('location');
      _credit = userDoc.get('credit');
      _phonenumber = userDoc.get('phone number');
      _imageurl = userDoc.get('imageurl');
      _password = userDoc.get('password');
      print('$_password');
    });

  }
  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  bool showPassword = false;
  @override

  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: SecondaryRed,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: SecondaryRed,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Setting()));
              print(_password);
              print(_email);
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 4,
                            color: Colors.white,
                          ),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(_imageurl),
                          )),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: PrimaryDarkRed,
                            ),
                            color: PrimaryDarkRed,
                          ),
                          child: IconButton(
                            padding: EdgeInsets.all(0),
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: ((builder) => bottomSheet()),
                              );
                              // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SettingsPage()));
                            },
                          ), // Icon( Icons.edit,color: Colors.white,),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),

              TextFormField(
                onChanged: (val) {
                  _newfname=_fname;
                  setState(() => _newfname= val);
                },
                // controller: emailController,
                decoration: ThemeHelper().textInputDecoration(
                    "$_fname", "Enter your first name"),
              ),
              SizedBox(height: 15,),
              TextFormField(
                onChanged: (val) {
                  _newlname=_lname;
                  setState(() => _newlname = val);
                },
                // controller: emailController,
                decoration: ThemeHelper().textInputDecoration(
                    "$_lname", "Enter your last name"),
              ),
              SizedBox(height: 15,),
              TextFormField(
                onChanged: (val) {
                  _newemail=_email;
                  setState(() => _newemail = val);
                },
                // controller: emailController,
                decoration: ThemeHelper().textInputDecoration(
                    "$_email", "Enter your email"),
              ),
              SizedBox(height: 15,),
              TextFormField(
                onChanged: (val) {
                  _newpassword=_password;
                  setState(() => _newpassword = val);
                },
                // controller: emailController,
                decoration: ThemeHelper().textInputDecoration(
                    "$_password", "Enter your password"),
              ),
              SizedBox(height: 15,),
              TextFormField(
                onChanged: (val) {
                  _newlocation=_location;
                  setState(() => _newlocation = val);
                },
                // controller: emailController,
                decoration: ThemeHelper().textInputDecoration(
                    "$_location", "Enter your location"),
              ),
              SizedBox(height: 15,),
              TextFormField(
                onChanged: (val) {
                  _newphonenumber=_phonenumber;
                  setState(() => _newphonenumber = val);
                },
                // controller: emailController,
                decoration: ThemeHelper().textInputDecoration(
                    "$_phonenumber", "Enter your number"),
              ),

              SizedBox(height: 15,),

              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    elevation: 10,
                    color: Colors.grey[200],
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {
                              FirebaseFirestore.instance.collection('userdata').doc(_userID).update({
                                  'email': _newemail,
                                  'first name': _newfname,
                                  'last name': _newlname,
                                  'phone number': _newphonenumber,
                                  'password': _newpassword,
                                  'location': _newlocation,

                                });

                    },
                    color: SecondaryRed,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: PrimaryGrey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile!;
    });
  }
}
