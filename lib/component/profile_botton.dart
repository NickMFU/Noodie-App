import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noodie_1/screen/setting.dart';
import 'package:noodie_1/screen/user_profile.dart';
import 'package:noodie_1/screen/onboard.dart';

enum Menu { itemOne, itemTwo, itemThree }

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
      icon: const Icon(Icons.person),
      offset: const Offset(0, 40),
      onSelected: (Menu item) {
        switch (item) {
          case Menu.itemOne:
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return ProfileScreen();
            }));
            break;
          case Menu.itemTwo:
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const SettingsPage2();
            }));
            break;
          case Menu.itemThree:
            FirebaseAuth.instance.signOut();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => IntroScreen()),
              (route) => true,
            );
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
        const PopupMenuItem<Menu>(
          value: Menu.itemOne,
          child: Text('Account'),
        ),
        const PopupMenuItem<Menu>(
          value: Menu.itemTwo,
          child: Text('Settings'),
        ),
        const PopupMenuItem<Menu>(
          value: Menu.itemThree,
          child: Text('Sign Out'),
        ),
      ],
    );
  }
}
