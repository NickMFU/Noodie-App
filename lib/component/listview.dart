import 'package:flutter/material.dart';
import 'package:noodie_1/core/extension.dart';
import 'package:noodie_1/component/rating.dart';
import 'package:noodie_1/screen/sammala.dart';
import '../../../core/app_style.dart';
import '../model/noodle_model.dart';
import 'package:noodie_1/screen/samice.dart';
import 'package:noodie_1/screen/samhot.dart';
import 'package:noodie_1/screen/mamatomyum.dart';
import 'package:noodie_1/screen/nissinramen.dart';

class NoodleListView extends StatelessWidget {
  final bool isHorizontal;
  final Function(Noodle noodle)? onTap;
  final List<Noodle> noodlelist;

  const NoodleListView(
      {Key? key,
      this.isHorizontal = true,
      this.onTap,
      required this.noodlelist})
      : super(key: key);

  Widget _noodleScore(Noodle noodle) {
    return Row(
      children: [
        StarRatingBar(score: noodle.score),
        const SizedBox(width: 10),
        Text(noodle.score.toString(), style: h4Style),
      ],
    ).fadeAnimation(1.0);
  }

  Widget _noodleImage(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(
        image,
        width: 150,
        height: 150,
      ),
    ).fadeAnimation(0.4);
  }

  Widget _listViewItem(Noodle noodle, int index, BuildContext context) {
    return InkWell(
      onTap: () {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => samyangmala()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => S2()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HotChicken()),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ramen()),
          );
        } else if (index == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => mama()),
          );
        } // Add more conditions as needed
      },
      child: isHorizontal == true
          ? Column(
              children: [
                Hero(
                  tag: index,
                  child: _noodleImage(noodle.images[0]),
                ),
                const SizedBox(height: 10),
                Text(noodle.title.addOverFlow, style: h4Style)
                    .fadeAnimation(0.8),
                _noodleScore(noodle),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _noodleImage(noodle.images[0]),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(noodle.title, style: h4Style).fadeAnimation(0.8),
                        const SizedBox(height: 5),
                        _noodleScore(noodle),
                        const SizedBox(height: 5),
                        Text(
                          noodle.description,
                          style: h5Style.copyWith(fontSize: 12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ).fadeAnimation(1.4)
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isHorizontal == true
        ? SizedBox(
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: noodlelist.length,
              itemBuilder: (_, index) {
                Noodle noodle = noodlelist[index];
                return _listViewItem(noodle, index, context);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.only(left: 15),
                );
              },
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            reverse: true,
            physics: const ClampingScrollPhysics(),
            itemCount: noodlelist.length,
            itemBuilder: (_, index) {
              Noodle noodle = noodlelist[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 10),
                child: _listViewItem(noodle, index, context),
              );
            },
          );
  }
}
