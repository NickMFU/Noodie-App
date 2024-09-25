import 'package:flutter/material.dart';
import 'package:noodie_1/core/app_asset.dart';
import 'package:noodie_1/model/noodle_model.dart';

class AppData {
  const AppData._();

  static const dummyText = "Review and getcoupon click!";

  static List<Noodle> noodleList = [
    Noodle(
      isFavorite: false,
      title: 'Samyang Mala Recipe',
      description: dummyText,
      score: 3.5,
      images: [
        AppAsset.samala1,
      ],
    ),
    Noodle(
      isFavorite: false,
      title: 'Samyang Hot chickem flavor ramen ICE',
      description: dummyText,
      score: 4.5,
      images: [
        AppAsset.samice1,
      ],
    ),
    Noodle(
      isFavorite: false,
      title: 'Samyang Dried Spicy Chicken Flavor',
      description: dummyText,
      score: 3.0,
      images: [
        AppAsset.samhot1,
      ],
    ),
    Noodle(
      isFavorite: false,
      title: 'Nissin Ramen',
      description: dummyText,
      score: 5.0,
      images: [
        AppAsset.ramen1,
        AppAsset.ramen1,
        AppAsset.ramen1,
      ],
    ),
    Noodle(
      isFavorite: false,
      title: 'Mama Tomtumgung',
      description: dummyText,
      score: 4.8,
      images: [
        AppAsset.tomyum1,
      ],
    ),
  ];
}
