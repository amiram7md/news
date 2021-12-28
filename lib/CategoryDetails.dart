import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/api_data/apiFunctions.dart';
import 'package:news/api_data/news_responses.dart';
import 'package:url_launcher/url_launcher.dart';
import 'HomePage.dart';
import 'api_data/sources_responses.dart';

class CategoryDetails extends StatefulWidget {
  static const routeName = 'CategoryDetails';

  CategoryDetails(this._categoryItem);
  CategoryItem _categoryItem;

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<SourcesResponses>(
        future: APIFunctions.loadNewsSources(widget._categoryItem.categoryID),
        builder:
            (BuildContext context, AsyncSnapshot<SourcesResponses> snapshot) {
          if (snapshot.hasError)
            return Center(child: Text(snapshot.error.toString()));
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          return CategorySourceTabs(snapshot.data?.sources?? []);
            }),
    );
  }
}

class CategorySourceTabs extends StatefulWidget {
  List<Sources> sources;

  CategorySourceTabs(this.sources);

  @override
  _CategorySourceTabsState createState() => _CategorySourceTabsState();
}

class _CategorySourceTabsState extends State<CategorySourceTabs> {
  int selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: widget.sources.length,
        initialIndex: 0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                onTap: (index){
                  selectedIndex = index ;
                  setState(() {
                  });
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: widget.sources.map((element) => TabItem(element ,
                selectedIndex == widget.sources.indexOf(element) )).toList(),
              ),
            ),
            NewsList(
                sources: widget.sources[selectedIndex],
            ),
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget{
  Sources sources ;
  bool isSelected ;
  TabItem(this.sources,this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8 , horizontal:  12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: isSelected
            ? Colors.green
            : Colors.transparent ,
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Text(sources.name?? "",
      style: TextStyle(
        color: isSelected
            ? Colors.white
            : Colors.green ,
      ), ),
    );
  }
}

class NewsList extends StatelessWidget{
  Sources? sources ;
  String? query;
  NewsList({this.sources, this.query});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: FutureBuilder<NewsResponses>(
            future: APIFunctions.loadNews( sources: sources?.id, query: query),
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
      ),
    );
  }

}

class NewsListData extends StatelessWidget{
  Articles articles ;
  NewsListData(this.articles);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context,
            NewsDescription.routeName ,
          arguments: articles);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                  child: Image.network(articles.urlToImage?? '')
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(articles.title?? '',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Text(articles.publishedAt?? '',
            textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}

class NewsDescription extends StatelessWidget{
  static const routeName = 'NewsDescription';

  @override
  Widget build(BuildContext context) {
    var articleArgs = ModalRoute.of(context)!.settings.arguments as Articles ;
    return Scaffold(
      appBar: AppBar(
        title: Text(articleArgs.title?? '',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(articleArgs.urlToImage?? '')
              ),
            ),
            Text(articleArgs.sources?.name?? ''),
            Text(articleArgs.title?? '',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(articleArgs.publishedAt?? '',
              textAlign: TextAlign.end,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(articleArgs.description?? '',
                style: TextStyle(
                    fontSize: 18,
                ),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: (){
                _launchURL(articleArgs.url?? '');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('View Full Articles'),
                  Icon(Icons.play_arrow),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
  void _launchURL(_url) async {
    if (!await launch(_url))
      throw 'Could not launch $_url';
  }
}
