import 'package:flutter/material.dart';
import '../../../core/app_asset.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:noodie_1/screen/onboard.dart';
import 'package:noodie_1/component/appbar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAsset.profilePic),
              SizedBox(height: 20),
              const Text(
                "Hello Users :",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                user!.email!,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAsset.githubPic,
                    width: 60,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Contact support",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              const Text(
                "6431503062@lamduan.mfu.ac.th",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: Text('Logout'),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return IntroScreen();
                  }));
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
