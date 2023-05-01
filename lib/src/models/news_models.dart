// To parse this JSON data, do
//
//     final newResponse = newResponseFromJson(jsonString);

import 'dart:convert';

NewResponse newResponseFromJson(String str) => NewResponse.fromJson(json.decode(str));

String newResponseToJson(NewResponse data) => json.encode(data.toJson());

class NewResponse {
    String status;
    int totalResults;
    List<Article> articles;

    NewResponse({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    factory NewResponse.fromJson(Map<String, dynamic> json) => NewResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

class Article {
    Source source;
    String? author;
    String title;
    String description;
    String url;
    String urlToImage;
    String publishedAt;
    String content;

    Article({
        required this.source,
        this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt,
        "content": content,
    };
}

class Source {
    String? id;
    String name;

    Source({
        this.id,
        required this.name,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
