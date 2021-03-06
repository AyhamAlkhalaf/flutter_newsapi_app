import 'package:flutter_newsapi_app/models/ArticleModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class News {
  List<ArticleModel> news =[];

  Future <void> getNews() async{

    String url = "http://newsapi.org/v2/top-headlines?country=in&apiKey=9eb8d2e0c8994085b71d18c73f64125d";
    
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok' ){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null  && element["description"] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"]
          );
          news.add(articleModel);
        }
      });
    }


  }




}

class CategoryNewsClass {

  List<ArticleModel> news =[];

  Future <void> getNews(String category) async{

    String url = "http://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=9eb8d2e0c8994085b71d18c73f64125d";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok' ){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null  && element["description"] != null){
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["content"]
          );
          news.add(articleModel);
        }
      });
    }


  }




}