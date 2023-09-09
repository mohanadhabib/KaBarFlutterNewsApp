import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/services/database_service.dart';
import 'package:flutter_news_app/models/country_model.dart';
import 'package:http/http.dart' as http;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


class SelectCountryProvider extends ChangeNotifier {
  String? countryName;
  int? length;
  TextEditingController? countrySearch = TextEditingController();
  ItemScrollController? scrollController = ItemScrollController();

  Future<List<Country>> getResponse() async {
    var url = Uri.parse("https://restcountries.com/v3.1/all");
    http.Response response = await http.get(url);
    List<dynamic> data = json.decode(response.body);
    List<Country> countryList = data.map((e) => Country.fromJson(e)).toList();
    length = countryList.length;
    return countryList;
  }

  Future<List<Country>> getSearch(String? searchCoun) async {
    var url = Uri.parse("https://restcountries.com/v3.1/name/${searchCoun}");
    http.Response response = await http.get(url);
    List<dynamic> data = json.decode(response.body);
    List<Country> countryList = data.map((e) => Country.fromJson(e)).toList();
    length = countryList.length;
    return countryList;
  }

  Future<void> scrollToIndex(int index) async {
    scrollController!.jumpTo(index: index);
  }

  Future<void> storeCountryName(String? name) async {
    String id = await Database.auth.currentUser!.uid;
    countryName = name;
    await Database.database
        .collection("Users")
        .doc(id)
        .update({"country": countryName});
  }

  void updateState() {
    notifyListeners();
  }
}
