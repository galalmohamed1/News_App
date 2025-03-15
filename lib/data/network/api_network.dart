import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app/core/constants/constans.dart';
import 'package:news_app/core/constants/end_point.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/data/models/sources_model.dart';
abstract class ApiNetwork {


  static Future<List<Source>> getAllSources(String categoryID) async {
    try {
      var queryParameters = {
        "apiKey": Constans.apiKEY,
        "category": categoryID,
      };

      var uri = Uri.https(
        Constans.baseUrl,
        EndPoint.getAllSources,
        queryParameters,
      );

      var response = await http.get(uri);

      log(response.request.toString());
      log(response.body.toString());

      Map<String, dynamic> data = jsonDecode(response.body);

      SourcesModel sourceModel = SourcesModel.fromjson(data);

      return sourceModel.sources;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<List<Article>> getAllArticles(String sourceID) async {
    try {
      var queryParameters = {
        "apiKey": Constans.apiKEY,
        "sources": sourceID,
      };

      var uri = Uri.https(
        Constans.baseUrl,
        EndPoint.getAllArticle,
        queryParameters,
      );

      var response = await http.get(uri);

      log(response.request.toString());
      log(response.body.toString());

      Map<String, dynamic> data = jsonDecode(response.body);

      ArticleModel articleModel = ArticleModel.fromJson(data);

      return articleModel.articles;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

}