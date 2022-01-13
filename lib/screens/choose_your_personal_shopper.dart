import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_personal_shopper/provider/feedback.dart';
import 'package:smart_personal_shopper/screens/Market/address.dart';
import 'package:smart_personal_shopper/screens/profile/profile.dart';

import 'package:smart_personal_shopper/data/user.dart';
import 'package:smart_personal_shopper/data/users.dart';

import 'package:smart_personal_shopper/widget/user_card.dart';


class Choose extends StatefulWidget {
  const Choose({Key? key}) : super(key: key);

  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  final usersRef = FirebaseFirestore.instance
      .collection('personal_Shopper')
      .withConverter<User>(
    fromFirestore: (snapshots, _) => User.fromJson(snapshots.data()!),
    toFirestore: (user, _) => user.toJson(),
  );
  final List<User> users =[];
  //final List<User> users= dummyUsers;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          //toolbarHeight: screensize.height * 0.1,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.red,
              size: 40,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          leadingWidth: 30,

        ),
        body:StreamBuilder<QuerySnapshot<User>>(
            stream: usersRef.snapshots(),
            builder: (context, snapshot) {

              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final data = snapshot.requireData;
              data.docs.forEach((element) {
                users.add(element.data());
              });
              return Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'choose your provider',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    users.isEmpty
                        ? const Text(
                      'No more users',
                      style: TextStyle(fontSize: 20),
                    )
                        : Stack(children: users.map(buildUser).toList()),
                    Flexible(child: Container()),
                    Row(children: [
                      Text("swipe ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("right to choose ",
                          style: TextStyle(
                            color: Color(0xFFff4d6d),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("and ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("left to go next",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                    ]),
                    SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              );
            }
        )
        //bottomNavigationBar: navbar(Home(), marketScreen(), Listof(), Profile(), context),
      );

  Widget buildUser(User user) {
    final userIndex = users.indexOf(user);
    final isUserInFocus = userIndex == users.length - 1;

    return Listener(
      onPointerMove: (pointerEvent) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.updatePosition(pointerEvent.localDelta.dx);
      },
      onPointerCancel: (_) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.resetPosition();
      },
      onPointerUp: (_) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.resetPosition();
      },
      child: Draggable(
        child: UserCardWidget(user: user, isUserInFocus: isUserInFocus),
        feedback: Material(
          type: MaterialType.transparency,
          child: UserCardWidget(user: user, isUserInFocus: isUserInFocus),
        ),
        childWhenDragging: Container(),
        onDragEnd: (details) => onDragEnd(details, user),
      ),
    );
  }

  void onDragEnd(DraggableDetails details, User user) {
    final minimumDrag = 10;
    if (details.offset.dx > minimumDrag) {
      user.isLiked = true;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Address( chosenUser: user)));
    } else if (details.offset.dx < -minimumDrag) {
      user.isSwipedOff = true;
      users.remove(user);

    }

    //setState(() => users.remove(user));
  }
}
