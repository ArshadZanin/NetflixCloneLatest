import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix_clone_latest/constants/all_strings.dart';
import 'package:netflix_clone_latest/models/content_info.dart';

class ApiManager{

  Future<Welcome?> getMovies() async{
    var client = http.Client();
    Welcome? newsModel;

    try {
      var response = await client.get(Uri.parse(AllString.newsUrl));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = Welcome.fromJson(jsonMap);
      }
    }on Exception{
      return newsModel;
    }
    return newsModel;
  }

}
