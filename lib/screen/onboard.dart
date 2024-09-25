import 'package:flutter/material.dart';
import 'package:noodie_1/core/app_style.dart';
import 'package:noodie_1/screen/login_page.dart';

import 'dashboard.dart';
import 'landing.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget introButton() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Homepage()),
              );
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                const EdgeInsets.all(8),
              ),
              backgroundColor:
                  MaterialStateProperty.all(Colors.white.withOpacity(0.4)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            icon: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.2),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            label: Text(
              "Get started",
              style: h3Style.copyWith(color: Colors.white),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/intro.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(flex: 3),
                Text(
                  "Noodie\n------------\nNoodle Forever",
                  style: h1Style.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  "Check Promotion get coupon in Noodlestore and review  noodle",
                  style: h3Style.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 20),
                introButton(),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
