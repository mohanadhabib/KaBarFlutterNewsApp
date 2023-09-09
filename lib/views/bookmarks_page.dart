import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/home_page_provider.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/widgets/bookmark_tile.dart';
import 'package:flutter_news_app/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 2;
    MyColors.currentTheme = Theme.of(context).scaffoldBackgroundColor;
    MyColors.isLightTheme =
        MyColors.currentTheme == MyColors.white ? true : false;
    return Consumer<HomePageProvider>(
        builder: (context, ref, child) => Scaffold(
              bottomNavigationBar: BottomNav(currentIndex: currentIndex),
              body: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.sizeOf(context).height * 0.035,
                    left: MediaQuery.sizeOf(context).width * 0.025,
                    right: MediaQuery.sizeOf(context).width * 0.025),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.sizeOf(context).height * 0.055,
                      ),
                      child: Text(
                        "Bookmark",
                        style: TextStyle(
                            color: MyColors.isLightTheme!
                                ? MyColors.black
                                : MyColors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.sizeOf(context).height * 0.035,
                      ),
                      child: TextField(
                        style:
                            TextStyle(fontSize: 16, color: MyColors.greySearch),
                        cursorColor: MyColors.greySearch,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              fontSize: 16, color: MyColors.greySearch),
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: Icon(Icons.search_rounded,
                                color: MyColors.greySearch, size: 30),
                          ),
                          filled: MyColors.isLightTheme! ? false : true,
                          fillColor: MyColors.greyDark,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: MyColors.isLightTheme!
                                      ? MyColors.greySearch
                                      : MyColors.greyDark)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: MyColors.isLightTheme!
                                      ? MyColors.greySearch
                                      : MyColors.greyDark)),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.685,
                      child: (ref.articles.isEmpty) ? Container() :  ListView(
                        children: [
                          ...ref.articles
                              .map((e) => Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: InkWell(
                                      onTap: () async {
                                        await ref
                                            .openNewsInWeb(Uri.parse(e.url!));
                                      },
                                      child: BookmarkTile(
                                          imgUrl: e.urlToImage!,
                                          title: e.title!,
                                          sourceName: e.source!.name!,
                                          publishedAt: e.publishedAt!),
                                    ),
                                  ))
                              .toList()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
