import 'dart:convert';

import 'package:doctorappointment/config/appconfig.dart';
import 'package:doctorappointment/modules/covid19_news/model/news.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Covid19NewClient {
  getNews() async {
    const url = "https://covid-193.p.rapidapi.com/statistics?country=Nigeria";
    const Map<String, String> headers = {
      "x-rapidapi-host": "covid-193.p.rapidapi.com",
      "x-rapidapi-key": "aae8544aafmsh29f17a40221af20p103a41jsna86b82bf7af9",
    };
    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var resBody = json.decode(response.body);
        News res = News.fromJson(resBody["response"][0]);
        return res;
      }
    } catch (e) {
      print(e);
    }
  }
}
