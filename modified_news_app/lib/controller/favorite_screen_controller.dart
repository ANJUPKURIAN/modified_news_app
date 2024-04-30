import 'dart:developer';

import 'package:modified_news_app/model/favorite_model.dart';
import 'package:modified_news_app/model/news_api_res_model.dart';
import 'package:modified_news_app/view/favorite_screen/favorite_screen.dart';
import 'package:flutter/material.dart';

class FavoriteScreenController with ChangeNotifier {
  List<FavoriteModel> favoriteList = [];

  addToFavorite(Article article, BuildContext context) {
    final isAlreadyFavorite =
        favoriteList.any((element) => element.article.title == article.title);
    if (isAlreadyFavorite) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FavoriteScreen()));
      log("Already in bookmark");
    } else {
      favoriteList.add(FavoriteModel(article: article, isFavorite: true));
    }
    notifyListeners();
  }

  deleteFromFavorite(int index) {
    favoriteList.removeAt(index);
    notifyListeners();
  }
}