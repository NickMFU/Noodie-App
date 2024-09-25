import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:noodie_1/core/colours.dart';

class StarRatingBar extends StatelessWidget {
  final double score;
  final double itemSize;

  const StarRatingBar({Key? key, required this.score, this.itemSize = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemPadding: EdgeInsets.zero,
      itemSize: itemSize,
      initialRating: score,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      glow: false,
      ignoreGestures: true,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: AppColors.orange,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
