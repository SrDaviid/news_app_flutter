import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:http/http.dart' as http;

final _URL_News = 'https://newsapi.org/v2';
final _Api_Key = '0cde8b763e124f929c5b251caa9ef1c3';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.planeDeparture, 'general'),
    Category(FontAwesomeIcons.heart, 'health'),
    Category(FontAwesomeIcons.building, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();
    categories.forEach((item) {
      categoryArticles[item.name] = [];
    });
  }

  String get selectedCategory {
    return _selectedCategory;
  }

  set selectedCategory(String value) {
    this._selectedCategory = value;

    this.getArticlesCategory(value);
    notifyListeners();
  }

  List<Article>? get getSelectedArticlesCategories =>
      this.categoryArticles[this.selectedCategory];

  getTopHeadlines() async {
    final url =
        Uri.parse('$_URL_News/top-headlines?country=us&apiKey=$_Api_Key');

    final resp = await http.get(url);

    final newResponse = newResponseFromJson(resp.body);

    this.headlines.addAll(newResponse.articles);
    notifyListeners();
  }

  getArticlesCategory(String category) async {
    //Para evitar articulos duplicados
    if (this.categoryArticles[category]!.length > 0) {
      return this.categoryArticles[category];
    }

    final url = Uri.parse(
        '$_URL_News/top-headlines?country=us&apiKey=$_Api_Key&category=$category');

    final resp = await http.get(url);

    final newResponse = newResponseFromJson(resp.body);

    this.categoryArticles[category]!.addAll(newResponse.articles);

    notifyListeners();
  }
}
