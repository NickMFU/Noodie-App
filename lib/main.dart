import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noodie_1/screen/onboard.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _firebaseInitialization = Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyB0-Lz-v7aInsvVuAhrcZYqbg_WTO_4hig',
      appId: '1:961321101742:android:da3a15071ca46afc15803f',
      messagingSenderId: '961321101742',
      projectId: 'noodie',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseInitialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Firebase initialization error: ${snapshot.error}'),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Home',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            home:IntroScreen(),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
