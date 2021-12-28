
import 'package:flutter/material.dart';
import 'package:news/api_data/apiFunctions.dart';
import 'CategoryDetails.dart';
import 'api_data/news_responses.dart';

class SearchFeature extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.green, // affects AppBar's background color
      ),
    );
  }
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.search,
          size: 35,
        ),
        onPressed: () {
          showResults(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.clear,
        size: 35,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: FutureBuilder<NewsResponses>(
          future: APIFunctions.loadNews(query: query),
          builder:
              (BuildContext context, AsyncSnapshot<NewsResponses> snapshot) {
            if (snapshot.hasError)
              return Center(child: Text(snapshot.error.toString()));
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            return ListView.builder(itemBuilder: (buildContext,index){
              return NewsListData(snapshot.data!.articles!.elementAt(index));
            },
              itemCount: snapshot.data?.articles?.length ,
            );
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      color: Colors.white,
    );
  }
}
