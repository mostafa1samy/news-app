import 'dart:convert';

//import 'package:news_cloud/models/article_model.dart';
import 'package:flutternews/model/article_model.dart';
import 'package:http/http.dart' as http;
//import 'package:news_cloud/models/articles_model.dart';
import 'package:flutternews/model/articles_model.dart';

class NewsApi {
  final String apiKey = 'ac491e6be0c7482cbe75f8cd489c5e68';
  Future<List<Article>> fetchArticles() async {
    try {
      http.Response response = await http.get(
          'https://newsapi.org/v2/top-headlines?country=eg&apiKey=$apiKey');
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesList articles = ArticlesList.fromJson(jsonData);
        List<Article> articlesList =
            articles.articles.map((e) => Article.fromJson(e)).toList();
        return articlesList;
      } else {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }


  Future<List<Article>> fetchArticlesByCategory(String category) async {
    try {
      http.Response response = await http.get(
          'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$apiKey');
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesList articles = ArticlesList.fromJson(jsonData);
        List<Article> articlesList =
            articles.articles.map((e) => Article.fromJson(e)).toList();
        return articlesList;
      } else {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }
}
