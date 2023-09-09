class News {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  News({this.status, this.totalResults, this.articles});

  News.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }

  Map<String,dynamic> toJson() => {
    "status":status,
    "totalResults":totalResults,
    "articles": articles!.map((e) => e.toJson()).toList()
  };
}

class Articles {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  Source? source;

  Articles(
      {
      this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
    source = Source.fromJson(json['source']);
  }
   Map<String,dynamic> toJson() => {
     "source" : source!.toJson(),
      "author": author,
      "title" : title,
      "description" : description ,
      "url" : url,
      "urlToImage" : urlToImage,
      "publishedAt" : publishedAt,
      "content" : content
  };
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
  Map<String,dynamic> toJson() => {
     "id": id,
     "name": name
  };
}
