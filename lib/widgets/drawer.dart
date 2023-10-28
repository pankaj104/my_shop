import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://pbs.twimg.com/profile_images/1343103537908121601/nl0jjJFv_400x400.jpg";
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: const Text("Pankaj Kumar"),
                accountEmail: const Text("pankaj@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  radius: 150.0,
                  backgroundImage: NetworkImage(imageUrl),
                )),
          ),
          // ignore: prefer_const_constructors
          ListTile(
            leading: const Icon(
              CupertinoIcons.home,
              color: Colors.black,
            ),
            title: const Text(
              "Home",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.black),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.black,
            ),
            title: Text(
              "Profile",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.black),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.black,
            ),
            title: Text(
              "Email me",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
