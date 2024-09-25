import 'package:flutter/material.dart';
import 'package:noodie_1/component/comment.dart';
import 'package:noodie_1/component/listview.dart';
import 'package:noodie_1/core/app_data.dart';
import 'package:noodie_1/core/app_style.dart';
import 'package:noodie_1/screen/landing.dart';
import 'package:share/share.dart';

class mama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'มาม่าต้มยำกุ้ง น้ำข้น',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Brand : MAMA',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.yellow[500],
          ),
          const Text('39'),
        ],
      ),
    );

    Color color = Color.fromARGB(255, 209, 16, 2);

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            // Code to be executed when the "REVIEW" button is pressed
          },
          child: _buildButtonColumn(color, Icons.star, 'REVIEW'),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => comment()),
            );
          },
          child: _buildButtonColumn(color, Icons.chat, 'COMMENT'),
        ),
        InkWell(
          onTap: () {
            Share.share('Check out this cool thing I found!');
          },
          child: _buildButtonColumn(color, Icons.share, 'SHARE'),
        ),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'มาม่าต้มยำกุ้ง สุดคลาสสิกมาในรูปแบบน้ำใส เส้นเหนียวนุ่ม รสชาติน้ำซุปเปรี้ยวเค็มเผ็ดกลมกล่อม'
        'มีส่วนผสมของน้ำพริกเผาและกุ้งแห้งในซองเครื่องปรุง มีความหอมเครื่องสมุนไพรและไทย ปริมาณ 55 กรัม ราคา 6 บาท ',
        softWrap: true,
      ),
    );

    SizedBox(
      height: 5,
    );

    return MaterialApp(
      title: 'login_page',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('มาม่าต้มยำกุ้ง'),
          backgroundColor: Color.fromARGB(255, 209, 16, 2),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
            },
          ),
        ),
        body: ListView(
          children: [
            Image.asset(
              "assets/image/tomyum.jpg",
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
            const Text("Popular", style: h2Style),
            NoodleListView(
              noodlelist: AppData.noodleList,
            ),
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
