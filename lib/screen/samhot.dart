import 'package:flutter/material.dart';
import 'package:noodie_1/component/comment.dart';
import 'package:noodie_1/component/getcoupon.dart';
import 'package:noodie_1/component/listview.dart';
import 'package:noodie_1/core/app_data.dart';
import 'package:noodie_1/core/app_style.dart';
import 'package:noodie_1/screen/landing.dart';
import 'package:share/share.dart';

class HotChicken extends StatefulWidget {
  const HotChicken({Key? key}) : super(key: key);

  @override
  _HotChickenState createState() => _HotChickenState();
}

class _HotChickenState extends State<HotChicken> {
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
                    'ซัมยังแห้งรสไก่สูตรเผ็ด',
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
          Icon(
            Icons.star,
            color: Colors.yellow[500],
          ),
          const Text('72'),
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
        'รสนี้ที่ละมุนีเชื่อว่าหลายคนเคยชิมกันแล้ว เป็นแบบแห้งรสเผ็ดสะใจ ยิ่งกินไปน้ำหูน้ำตายิ่งไหลเจ้าค่ะ บะหมี่กึ่งสำเร็จรูปของซัมยังที่'
        'เป็นรสไก่ เค้าจะมีป้ายฮาลาลแปะไว้ที่ซองด้วยเจ้าค่ะ อิสลามทานได้ไร้กังวล แค่ต้องเตรียมน้ำไว้ดับความเผ็ดร้อนสัก 1 โอ่งน่าจะพอเจ้าค่ะ '
        'ซองนี้ละมุนีมอบ 3 จีบเต็ม 👌👌👌 เพราะถึงจะเผ็ดร้อนแต่ก็อร่อยสะใจไปพร้อมกันเจ้าค่ะ',
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
          title: const Text('ซัมยังแห้งรสไก่สูตรเผ็ด'),
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
              "assets/image/w-1.jpg",
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return comment();
                }));
              },
              child: Text(
                "Comment",
                style: TextStyle(color: Colors.white),
              ),
            ),
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
