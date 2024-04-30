import 'package:modified_news_app/model/news_api_res_model.dart';
import 'package:flutter/material.dart';

class FavoriteModel with ChangeNotifier {
  Article article;
  bool isFavorite;

  FavoriteModel({required this.article, this.isFavorite = false});
}