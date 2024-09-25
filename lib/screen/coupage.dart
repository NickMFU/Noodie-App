import 'package:flutter/material.dart';
import 'package:noodie_1/component/coupon.dart';
import 'package:noodie_1/component/search.dart';
import 'package:noodie_1/component/coupon2.dart';
import 'package:noodie_1/screen/landing.dart';
import 'package:noodie_1/component/BottomBar.dart';

class coupage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 164, 148),
        appBar: AppBar(
          title: const Text('Your coupon'),
          backgroundColor: Color.fromARGB(255, 209, 16, 2),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
            },
          ),
        ),
        body: ListView(children: const [
          SizedBox(height: 25),
          SearchBar(),
          SizedBox(height: 25),
          Coupon1(),
          SizedBox(height: 25),
          Coupon2(),
          SizedBox(height: 25),
        ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.pages),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          onPressed: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Homepage();
            }))
          },
        ),
      ),
    );
  }
}
