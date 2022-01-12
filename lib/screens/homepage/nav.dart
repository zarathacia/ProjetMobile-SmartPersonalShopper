import 'package:flutter/material.dart';
import 'package:smart_personal_shopper/screens/login_registration/login.dart';

import '../chat/Chat_With_Personal_shopper.dart';
import '../profile/profile.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Kevin Pouya'),
            accountEmail: Text('kevin.pouya56@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipRRect(
                child: Image.asset('images/pouya.jfif'),
                borderRadius: BorderRadius.circular(150),
              ),
              radius: 100.0,
            ),
          ),
          ListTile(
              leading: Icon(Icons.person),
              title: Text('chat'),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Chat()))),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
            onTap: () => null,
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
              title: Text('Exit'),
              leading: Icon(Icons.exit_to_app),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Login()))),
        ],
      ),
    );
  }
}
