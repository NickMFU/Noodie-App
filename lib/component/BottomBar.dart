import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:noodie_1/screen/landing.dart';
import 'package:noodie_1/screen/NoodleShop.dart';
import 'package:noodie_1/screen/coupage.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xff6200ee),
      unselectedItemColor: const Color(0xff757575),
      backgroundColor: Colors.white,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });

        switch (index) {
          case 0:
            // Navigate to the home page
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return Homepage();
            }));
            break;
          case 1:
            // Navigate to the likes page
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return NewsFeedPage2();
            }));
            break;
          case 2:
            // Navigate to the search page
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return coupage();
            }));
            break;
        }
      },
      items: [
        SalomonBottomBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
          selectedColor: Colors.purple,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.restaurant),
          title: Text("Noodle Store"),
          selectedColor: Colors.pink,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.pages),
          title: Text("Coupon"),
          selectedColor: Colors.orange,
        ),
      ],
    );
  }
}
 //bottomNavigationBar: BottomNavigationBar(
      //    items: const <BottomNavigationBarItem>[
      //      BottomNavigationBarItem(
      //        icon: Icon(Icons.home),
      //        label: 'Home',
      //      ),
      //      BottomNavigationBarItem(
      //        icon: Icon(Icons.shop),
      //        label: 'Noodle shop',
      //      ),
      //      BottomNavigationBarItem(
      //        icon: Icon(Icons.person),
      //        label: 'Account',
      //      ),
      //    ],
      //    selectedItemColor: Colors.amber[800],
      //    onTap: (int index) {
      //      switch (index) {
      //        case 0:
      //          // Navigate to the home page
      //          Navigator.push(context, MaterialPageRoute(builder: (context) {
      //            return landingpage();
      //          }));
      //          break;
      //        case 1:
      //          // Navigate to the noodle shop page
      //          Navigator.push(context, MaterialPageRoute(builder: (context) {
      //            return NoodleShop();
      //          }));
      //          break;
      //        case 2:
      //         // Navigate to the account page
      //          Navigator.push(context, MaterialPageRoute(builder: (context) {
      //            return SettingsPage2();
      //          }));
      //          break;
      //      }
      //    },
      //  ),
