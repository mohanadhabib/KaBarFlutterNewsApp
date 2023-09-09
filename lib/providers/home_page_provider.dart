import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/services/database_service.dart';
import 'package:flutter_news_app/models/news_model.dart';
import 'package:flutter_news_app/services/preference_service.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class HomePageProvider extends ChangeNotifier {
  String bookmarksKey = "bookmarks";
  String? country;
  TextEditingController? searchController = TextEditingController();
  DateTime time = DateTime.now();
  List<Articles> articles = [];
  List<String> list  = [];

  Future<News> getNews(String st) async {
    var url = Uri.parse(st);
    http.Response response = await http.get(url);
    Map<String, dynamic> res = json.decode(response.body);
    country = await getDatabaseInfo();
    return News.fromJson(res);
  }

  Future<String> getDatabaseInfo() async {
    String? id = await Database.auth.currentUser!.uid;
    DocumentSnapshot<Map<String, dynamic>> country =
        await Database.database.collection("Users").doc(id).get();
    return country['country'];
  }
    Future<void> openNewsInWeb(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  String calculateTime(String time) {
    DateTime now = DateTime.now();
    DateTime PublishTime = DateTime.parse(time);
    String result;
    int month = now.month - PublishTime.month;
    int day = now.day - PublishTime.day;
    int hour = now.hour - PublishTime.hour;
    int minute = now.minute - PublishTime.minute;
    if (month > 0) {
      result = month.toString() + 'month ago';
    } else if (day > 0) {
      result = day.toString() + 'd ago';
    } else if (hour > 0) {
      result = hour.toString() + 'h ago';
    } else {
      result = minute.toString() + 'm ago';
    }
    return result;
  }
  Future<void> addToBookmark(Articles articles) async{
    list = SP.preferences!.getStringList(bookmarksKey) ?? [];
    String item = json.encode(articles.toJson());
    list.add(item);
    await SP.preferences?.setStringList(bookmarksKey, list);
  }
  void getBookmarks(){
    list = SP.preferences!.getStringList(bookmarksKey)!;
    List<dynamic> mapList = list.map((e) => json.decode(e)).toList();
    articles = mapList.map((e) => Articles.fromJson(e)).toList();
  }

  void updateState() {
    notifyListeners();
  }

}
