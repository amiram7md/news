
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api_data/news_responses.dart';
import 'package:news/api_data/sources_responses.dart';

class APIFunctions {

  static const String apiKey = '152ff1b8aa2342bb9533a2632f473d45';
  static Future<SourcesResponses> loadNewsSources(String category) async {

    var queryParameters = {
      'apiKey' : apiKey ,
      'category' : category ,
    };
    var uri = Uri.https('newsapi.org',
        '/v2/top-headlines/sources', queryParameters
    );
    var response = await http.get(uri);
    var sourcesResponse =  SourcesResponses.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
      return sourcesResponse ;
    }
    // If the server did not return a 200 OK response,
    // then throw an exception.
    else {
      if (sourcesResponse.message != null)
        throw Exception(sourcesResponse.message);
      throw Exception('Failed to load Sources');
    }
  }
  static Future<NewsResponses> loadNews(String? sources , String? searchQuery) async {
    var queryParameters = {
      'apiKey' : apiKey ,
      'sources' : sources ,
      'q' : searchQuery ,
    };
    var uri = Uri.https('newsapi.org',
        '/v2/everything', queryParameters
    );
    var response = await http.get(uri);
    var newsResponses =  NewsResponses.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return newsResponses ;
    }
    // If the server did not return a 200 OK response,
    // then throw an exception.
    else {
      if (newsResponses.message != null)
        throw Exception(newsResponses.message);
      throw Exception('Failed to load Sources');
    }

  }
}
