import 'package:flutter/material.dart';
import 'package:noodie_1/component/comment.dart';
import 'package:noodie_1/component/BottomBar.dart';
import 'package:noodie_1/component/getcoupon.dart';
import 'package:share/share.dart';
import 'package:noodie_1/component/listview.dart';
import 'package:noodie_1/core/app_data.dart';
import 'package:noodie_1/core/app_style.dart';

class S2 extends StatefulWidget {
  @override
  _S2State createState() => _S2State();
}

class _S2State extends State<S2> {
  int starCount = 139;
  bool _isCouponClicked = false;
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
                    'ซัมยังบะหมี่เย็นแบบแห้งรสไก่สูตรเผ็ด',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Brand : Samyang',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          IconButton(
            icon: Icon(Icons.star),
            color: Colors.yellow[500],
            onPressed: () {
              setState(() {
                starCount++;
              });
            },
          ),
          Text('$starCount'),
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
        'สำหรับสูตรนี้เป็นสูตรไก่เผ็ดแบบเย็นเจ้าค่ะ คือนำเส้นไปต้มจนสุก แล้วแช่น้ำเย็นก่อนเทน้ำออก แล้วค่อยปรุงเครื่องเจ้าค่ะ เส้นเย็นๆ ไม่เพียงดับร้อน แต่ยังช่วยลดระดับความเผ็ดด้วยเจ้าค่ะ'
        'ซองนี้ละมุนีค่อนข้างเฟลเจ้าค่ะ เพราะเปิดซองมาเส้นเหม็นหืน ดูวันหมดอายุก็อีกหลายเดือน เอาไปต้ม ไปแช่ก็แล้ว สุดท้ายเส้นก็เหม็นหืนอยู่ดี ละมุนีเลยขอยกมือไหว้หนึ่งทีเจ้าค่ะ ',
        softWrap: true,
      ),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Define a function to handle the back button press
              Navigator.of(context).pop();
            },
          ),
          title: const Text('Samyang Hot chickem flavor ramen ICE'),
          backgroundColor: Color.fromARGB(255, 209, 16, 2),
        ),
        body: ListView(
          children: [
            Image.asset(
              "assets/image/w-2.jpg",
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
            CouponButton(
              isCouponClicked: _isCouponClicked,
              onTap: () {
                setState(() {
                  _isCouponClicked = true;
                });
              },
            ),
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
