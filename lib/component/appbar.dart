import 'package:flutter/material.dart';
import 'package:noodie_1/component/profile_botton.dart';
import 'package:noodie_1/core/app_style.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? userEmail;

  const MyAppBar({Key? key, this.userEmail}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        color: Colors.red, // Set background color to red
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome to Noodle time",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    Text("Find noodle store",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
                ProfileIcon(),
                if (userEmail != null)
                  Text(userEmail!,
                      style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
