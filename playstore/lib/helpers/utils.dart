import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:playstore/models/appDataModel.dart';
import 'package:playstore/models/headingModel.dart';

class Utils {
  static List<AppDataModel> getMockedCategories() {
    return [
      AppDataModel(
        imageUrl: "https://cdn-icons-png.flaticon.com/512/124/124034.png?w=360",
        name: "WhatsApp Messenger",
        rating: "4.2",
        dataType: "recommended",
      ),
      AppDataModel(
        imageUrl:
            "https://play-lh.googleusercontent.com/RGvuFCqPOIiR1i9QDN6-HNt5nOuWj4zuqQduxnJn0ughdo-yhAJNG1r6W1A3Fc6Z9w",
        name: "Lightroom Photo & Video Editor",
        rating: " 4.3",
        dataType: "popular",
      ),
      AppDataModel(
          imageUrl:
              "https://site.onenote.com/161571440451_Images/onenoteicon-256.png",
          name: "Microsoft Onenote",
          rating: "4.5",
          dataType: "recent"),
      AppDataModel(
          imageUrl:
              "https://help.twitter.com/content/dam/help-twitter/brand/logo.png",
          name: "Twitter",
          rating: "4.3",
          dataType: "popular"),
      AppDataModel(
          imageUrl:
              "https://help.twitter.com/content/dam/help-twitter/brand/logo.png",
          name: "Twitter",
          rating: "4.3",
          dataType: "popular"),
      AppDataModel(
          imageUrl:
              "https://help.twitter.com/content/dam/help-twitter/brand/logo.png",
          name: "Twitter",
          rating: "4.3",
          dataType: "popular"),
      AppDataModel(
          imageUrl:
              "https://help.twitter.com/content/dam/help-twitter/brand/logo.png",
          name: "Twitter",
          rating: "4.3",
          dataType: "recommended"),
      AppDataModel(
          imageUrl:
              "https://help.twitter.com/content/dam/help-twitter/brand/logo.png",
          name: "Twitter",
          rating: "4.3",
          dataType: "recommended"),
    ];
  }
}

// Map Data = {
//   "recommendedList": {
//     "image": 'sasasasas',
//     "title": '',
//   },
//   "popularList": {}
// };

class Datas {
  List<RecomendedLIst> recomlist;
  List<PopularLIst> poplist;
  List<RecentList> reclist;
  Datas(this.recomlist, this.poplist, this.reclist);
}

class RecomendedLIst {
  String? imageUrl;
  String? name;
  String? rating;

  RecomendedLIst(
      {required this.imageUrl, required this.name, required this.rating});
}

class PopularLIst {
  String? imageUrl;
  String? name;
  String? rating;

  PopularLIst(
      {required this.imageUrl, required this.name, required this.rating});
}

class RecentList {
  String imageUrl;
  String name;
  String rating;

  RecentList(
      {required this.imageUrl, required this.name, required this.rating});
}
