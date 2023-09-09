// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/home_page_provider.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/widgets/tab_view.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  int? itemCount;
  double? sourceListHeight;
  SearchView({this.itemCount, this.sourceListHeight});
  @override
  State<StatefulWidget> createState() => _SearchView();
}
class _SearchView extends State<SearchView> with TickerProviderStateMixin{
  
   List<String> sources = [
    'News',
    'Topics',
    'Author',
  ];
  @override
  Widget build(BuildContext context) {
    TabController controller =
        TabController(length: sources.length, vsync: this);
    return Consumer<HomePageProvider>(
      builder:  (context,ref, child) =>  Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.03),
          child: Column(
            children: [
              Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height*0.085,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height*0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TabBar(
                            isScrollable: true,
                            controller: controller,
                            labelColor: MyColors.isLightTheme == true
                                ? MyColors.black
                                : MyColors.white,
                            unselectedLabelColor: MyColors.greyText,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorWeight: 3,
                            splashBorderRadius: BorderRadius.circular(5),
                            labelPadding: EdgeInsets.only(bottom: 10,right: 25),
                            labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
                            tabs: [
                              Text(sources[0]),
                              Text(sources[1]),
                              Text(sources[2]),
                            ]),
                      ],
                    ),
                  )),
                  Container(
                width: MediaQuery.sizeOf(context).width,
                height: widget.sourceListHeight != null
                    ? widget.sourceListHeight
                    : MediaQuery.sizeOf(context).height * 0.64,
                child: TabBarView(controller: controller, children: [
                  TabView(
                      itemCount: widget.itemCount,
                      future: ref.getNews(
                          "https://newsapi.org/v2/top-headlines?country=us&q=${ref.searchController!.text}&apiKey=4f5c7ab474bc4dd9b26ffc259bd23e31")),
                  TabView(
                      itemCount: widget.itemCount,
                      future: ref.getNews(
                          "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=4f5c7ab474bc4dd9b26ffc259bd23e31")),
                  TabView(
                      itemCount: widget.itemCount,
                      future: ref.getNews(
                          "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4f5c7ab474bc4dd9b26ffc259bd23e31")),
                ]),
              )
            ],
          )),
    );
  }
}