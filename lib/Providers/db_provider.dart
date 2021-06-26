import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_task/Models/articles_model.dart';
import 'package:project_task/Models/db_handler.dart';

class DBProvider with ChangeNotifier {
  Future<List<ArticlesModel>> fetchArticle() async {
    try {
      List<ArticlesModel> articlesList = await DBHandler.instance.getArticles();
      return articlesList;
    } on DioError catch (error) {
      print(error.message);
      return [];
    }
  }
}
