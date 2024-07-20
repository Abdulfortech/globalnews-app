import 'package:global_news/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {

    String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=4ad39c6ea250425486a415ad83cd031f';

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData['articles'].forEach((element) {
        if(element['urlToImage'] != null){
          ArticleModel articleModel = ArticleModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content']);

          news.add(articleModel);
        }
      });
    }
  }
}