// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/home_page_provider.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/widgets/tab_view.dart';
import 'package:provider/provider.dart';

class SourcesList extends StatefulWidget {
  int? itemCount;
  double? sourceListHeight;
  SourcesList({this.itemCount, this.sourceListHeight});
  @override
  State<StatefulWidget> createState() => _SourcesListState();
}

class _SourcesListState extends State<SourcesList>
    with TickerProviderStateMixin {
  List<String> sources = [
    'All',
    'Sports',
    'Business',
    'Health',
    'Technology',
    'Science',
    'Politics'
  ];

  @override
  Widget build(BuildContext context) {
    TabController controller =
        TabController(length: sources.length, vsync: this);
    return Consumer<HomePageProvider>(
      builder: (context, ref, child) => 
       Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.03),
          child: Column(
            children: [
              Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 30,
                  child: TabBar(
                      isScrollable: true,
                      controller: controller,
                      labelColor: MyColors.isLightTheme == true
                          ? MyColors.black
                          : MyColors.white,
                      unselectedLabelColor: MyColors.greyText,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 2,
                      splashBorderRadius: BorderRadius.circular(5),
                      labelPadding: EdgeInsets.only(right: 10),
                      tabs: [
                        Text(sources[0]),
                        Text(sources[1]),
                        Text(sources[2]),
                        Text(sources[3]),
                        Text(sources[4]),
                        Text(sources[5]),
                        Text(sources[6])
                      ])),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: widget.sourceListHeight != null
                    ? widget.sourceListHeight
                    : MediaQuery.sizeOf(context).height * 0.2395,
                child: TabBarView(controller: controller, children: [
                  TabView(
                      itemCount: widget.itemCount,
                      future: ref.getNews(
                          "https://newsapi.org/v2/top-headlines?country=us&apiKey=4f5c7ab474bc4dd9b26ffc259bd23e31")),
                  TabView(
                      itemCount: widget.itemCount,
                      future: ref.getNews(
                          "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=4f5c7ab474bc4dd9b26ffc259bd23e31")),
                  TabView(
                      itemCount: widget.itemCount,
                      future: ref.getNews(
                          "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4f5c7ab474bc4dd9b26ffc259bd23e31")),
                  TabView(
                      itemCount: widget.itemCount,
                      future: ref.getNews(
                          "https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=4f5c7ab474bc4dd9b26ffc259bd23e31")),
                  TabView(
                      itemCount: widget.itemCount,
                      future: ref.getNews(
                          "https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=4f5c7ab474bc4dd9b26ffc259bd23e31")),
                  TabView(
                      itemCount: widget.itemCount,
                      future: ref.getNews(
                          "https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=4f5c7ab474bc4dd9b26ffc259bd23e31")),
                  TabView(
                      itemCount: widget.itemCount,
                      future: ref.getNews(
                          "https://newsapi.org/v2/top-headlines?country=us&category=politics&apiKey=4f5c7ab474bc4dd9b26ffc259bd23e31"))
                ]),
              )
            ],
          )),
    );
  }
}
