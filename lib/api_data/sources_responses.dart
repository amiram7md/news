/// status : "ok"
/// sources : [{"id":"bbc-sport","name":"BBC Sport","description":"The home of BBC Sport online. Includes live sports coverage, breaking news, results, video, audio and analysis on Football, F1, Cricket, Rugby Union, Rugby League, Golf, Tennis and all the main world sports, plus major events such as the Olympic Games.","url":"http://www.bbc.co.uk/sport","category":"sports","language":"en","country":"gb"},{"id":"bleacher-report","name":"Bleacher Report","description":"Sports journalists and bloggers covering NFL, MLB, NBA, NHL, MMA, college football and basketball, NASCAR, fantasy sports and more. News, photos, mock drafts, game scores, player profiles and more!","url":"http://www.bleacherreport.com","category":"sports","language":"en","country":"us"},{"id":"espn","name":"ESPN","description":"ESPN has up-to-the-minute sports news coverage, scores, highlights and commentary for NFL, MLB, NBA, College Football, NCAA Basketball and more.","url":"http://espn.go.com","category":"sports","language":"en","country":"us"},{"id":"espn-cric-info","name":"ESPN Cric Info","description":"ESPN Cricinfo provides the most comprehensive cricket coverage available including live ball-by-ball commentary, news, unparalleled statistics, quality editorial comment and analysis.","url":"http://www.espncricinfo.com/","category":"sports","language":"en","country":"us"},{"id":"football-italia","name":"Football Italia","description":"Italian football news, analysis, fixtures and results for the latest from Serie A, Serie B and the Azzurri.","url":"http://www.football-italia.net","category":"sports","language":"en","country":"it"},{"id":"four-four-two","name":"FourFourTwo","description":"The latest football news, in-depth features, tactical and statistical analysis from FourFourTwo, the UK&#039;s favourite football monthly.","url":"http://www.fourfourtwo.com/news","category":"sports","language":"en","country":"gb"},{"id":"fox-sports","name":"Fox Sports","description":"Find live scores, player and team news, videos, rumors, stats, standings, schedules and fantasy games on FOX Sports.","url":"http://www.foxsports.com","category":"sports","language":"en","country":"us"},{"id":"lequipe","name":"L'equipe","description":"Le sport en direct sur L'EQUIPE.fr. Les informations, résultats et classements de tous les sports. Directs commentés, images et vidéos à regarder et à partager !","url":"https://www.lequipe.fr","category":"sports","language":"fr","country":"fr"},{"id":"marca","name":"Marca","description":"La mejor información deportiva en castellano actualizada minuto a minuto en noticias, vídeos, fotos, retransmisiones y resultados en directo.","url":"http://www.marca.com","category":"sports","language":"es","country":"es"},{"id":"nfl-news","name":"NFL News","description":"The official source for NFL news, schedules, stats, scores and more.","url":"http://www.nfl.com/news","category":"sports","language":"en","country":"us"},{"id":"nhl-news","name":"NHL News","description":"The most up-to-date breaking hockey news from the official source including interviews, rumors, statistics and schedules.","url":"https://www.nhl.com/news","category":"sports","language":"en","country":"us"},{"id":"talksport","name":"TalkSport","description":"Tune in to the world's biggest sports radio station - Live Premier League football coverage, breaking sports news, transfer rumours &amp; exclusive interviews.","url":"http://talksport.com","category":"sports","language":"en","country":"gb"},{"id":"the-sport-bible","name":"The Sport Bible","description":"TheSPORTbible is one of the largest communities for sports fans across the world. Send us your sporting pictures and videos!","url":"https://www.thesportbible.com","category":"sports","language":"en","country":"gb"}]

class SourcesResponses {
  SourcesResponses({
      String? status, 
      List<Sources>? sources,}){
    _status = status;
    _code = code;
    _message = message ;
    _sources = sources;
}

  SourcesResponses.fromJson(dynamic json) {
    _status = json['status'];
    _code = json['code'];
    _message = json['message'];
    if (json['sources'] != null) {
      _sources = [];
      json['sources'].forEach((v) {
        _sources?.add(Sources.fromJson(v));
      });
    }
  }
  String? _status;
  String? _code;
  String? _message;
  List<Sources>? _sources;

  String? get status => _status;
  String? get  code => _code;
  String? get message => _message;
  List<Sources>? get sources => _sources;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_sources != null) {
      map['sources'] = _sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "bbc-sport"
/// name : "BBC Sport"
/// description : "The home of BBC Sport online. Includes live sports coverage, breaking news, results, video, audio and analysis on Football, F1, Cricket, Rugby Union, Rugby League, Golf, Tennis and all the main world sports, plus major events such as the Olympic Games."
/// url : "http://www.bbc.co.uk/sport"
/// category : "sports"
/// language : "en"
/// country : "gb"

class Sources {
  Sources({
      String? id, 
      String? name, 
      String? description, 
      String? url, 
      String? category, 
      String? language, 
      String? country,}){
    _id = id;
    _name = name;
    _description = description;
    _url = url;
    _category = category;
    _language = language;
    _country = country;
}

  Sources.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _url = json['url'];
    _category = json['category'];
    _language = json['language'];
    _country = json['country'];
  }
  String? _id;
  String? _name;
  String? _description;
  String? _url;
  String? _category;
  String? _language;
  String? _country;

  String? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get url => _url;
  String? get category => _category;
  String? get language => _language;
  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['url'] = _url;
    map['category'] = _category;
    map['language'] = _language;
    map['country'] = _country;
    return map;
  }

}