import 'package:intl/intl.dart';

class ArticlesModel {
  final String? title, abstractOfArticle, imgUrl;
  final DateTime? historyPublish, historyCreation;

  ArticlesModel.fromJson(dynamic json)
      : this.title = json['title'],
        this.abstractOfArticle = json['abstract'],
        this.historyPublish = DateFormat("yyyy-MM-dd'T'HH:mm:ss-SSS").parse(json['published_date']),
        this.historyCreation = DateFormat("yyyy-MM-dd'T'HH:mm:ss-SSS").parse(json['created_date']),
        this.imgUrl = json['multimedia'][0]['url'];
}
