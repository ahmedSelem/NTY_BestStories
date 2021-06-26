import 'package:dio/dio.dart';
import 'package:project_task/Helpers/custom_links.dart';
import 'package:project_task/Models/articles_model.dart';

class DBHandler {
  static DBHandler _instance = DBHandler._private();

  DBHandler._private();

  static DBHandler get instance => _instance;

  Dio _dio = Dio();

  Future<List<ArticlesModel>> getArticles() async {
    String url = '${CustomLinks.mainUrl}/svc/topstories/v2/home.json';
    final params = {
      'api-key': CustomLinks.apiKey,
    };
    Response response = await _dio.get(url, queryParameters: params);
    List<ArticlesModel> articlesList =
        (response.data['results'] as List).map((e) {
      return ArticlesModel.fromJson(e);
    }).toList();
    return articlesList;
  }
}
