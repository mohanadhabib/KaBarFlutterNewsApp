import 'package:flutter/material.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/widgets/bottom_nav_bar.dart';
import 'package:flutter_news_app/widgets/trending_news_tile.dart';

class Trending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    MyColors.currentTheme = Theme.of(context).scaffoldBackgroundColor;
    MyColors.isLightTheme =
        MyColors.currentTheme == MyColors.white ? true : false;
    return Scaffold(
        bottomNavigationBar: BottomNav(currentIndex: currentIndex),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.sizeOf(context).width * 0.05,
                  right: MediaQuery.sizeOf(context).width * 0.05,
                  top: MediaQuery.sizeOf(context).height * 0.075,
                  bottom: MediaQuery.sizeOf(context).height * 0.025),
              child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                                borderRadius: BorderRadius.circular(20),
                                splashColor: MyColors.blue,
                                onTap: () => Navigator.pop(context),
                                child: Icon(Icons.arrow_back,
                                    color: MyColors.greyBack)),
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.sizeOf(context).width * 0.295),
                              child: Text(
                                'Trending',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: MyColors.isLightTheme!
                                        ? MyColors.black
                                        : MyColors.greySearch),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.sizeOf(context).width * 0.275),
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  splashColor: MyColors.blue,
                                  onTap: () {},
                                  child: Icon(Icons.more_vert_rounded,
                                      color: MyColors.greyBack)),
                            ),
                          ],
                        ),
                      ]))),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.7995,
            width: MediaQuery.sizeOf(context).width,
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.sizeOf(context).height * 0.025,
                          right: MediaQuery.sizeOf(context).width * 0.025,
                          left: MediaQuery.sizeOf(context).width * 0.025),
                      child: TrendingNewsTile(index: index),
                    )),
          )
        ]));
  }
}
