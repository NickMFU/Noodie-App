import 'package:flutter/material.dart';
import 'package:noodie_1/component/banner.dart';
import 'package:noodie_1/screen/samhot.dart';
import 'package:noodie_1/screen/mamatomyum.dart';
import 'package:noodie_1/screen/nissinramen.dart';
import 'package:noodie_1/screen/samice.dart';
import 'package:noodie_1/component/search.dart';
import 'package:noodie_1/component/BottomBar.dart';
import 'package:noodie_1/screen/coupage.dart';
import 'package:noodie_1/component/listview.dart';
import 'package:noodie_1/core/app_data.dart';
import 'package:noodie_1/component/appbar.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noodie',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: const MyAppBar(),
        bottomNavigationBar: const MyBottomBar(),
        body: ListView(
          children: [
            const SizedBox(height: 25),
            const SearchBar(),
            const SizedBox(height: 25),
            SlidePictureBanner(
              title: 'Noodle shop Recommend',
              images: [
                'https://mpics.mgronline.com/pics/Images/565000006633901.JPEG',
                'https://sls-prod.api-onscene.com/partner_files/trueidintrend/327513/cover_image/%E0%B8%AB%E0%B8%99%E0%B9%89%E0%B8%B2%E0%B8%9B%E0%B8%81_6.png',
                'https://lh5.googleusercontent.com/p/AF1QipPjcJefWiiQN0BsfLnUoQNWvcRofC4kIrNkR4um=w325-h218-n-k-no',
              ],
              height: 350.00,
            ),
            NoodleListView(
              noodlelist: AppData.noodleList,
              isHorizontal: false,
            ),
            Image.asset(
              "assets/image/_n.jpg",
              width: 150,
              height: 350,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 25),
            Image.asset(
              "assets/image/tomyum.jpg",
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(
                width: 50,
                height: 30,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.list),
                  label: const Text("Mama Tom Yum Gung"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return mama();
                    }));
                  },
                )),
            const SizedBox(height: 25),
            Image.asset(
              "assets/image/nissin.jpg",
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(
                width: 100,
                height: 30,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.list),
                  label: const Text("Nissin Ramen"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ramen();
                    }));
                  },
                )),
            const SizedBox(height: 25),
            Image.asset(
              "assets/image/w-1.jpg",
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(
                width: 100,
                height: 30,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.list),
                  label: const Text("Samyang Hot chickem flavor ramen"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const HotChicken();
                    }));
                  },
                )),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => S2()),
                );
              },
              child: Stack(
                children: [
                  Image.asset(
                    "assets/image/w-2.jpg",
                    width: 650,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Center(
                        child: Text(
                          "Samyang Hot chicken flavor ramen ICE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.pages),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          onPressed: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return coupage();
            }))
          },
        ),
      ),
    );
  }
}
