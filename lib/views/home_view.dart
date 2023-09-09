import 'package:flutter/material.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/views/home_page_latest_news.dart';
import 'package:flutter_news_app/views/trending_page.dart';
import 'package:flutter_news_app/widgets/sources_list.dart';
import 'package:flutter_news_app/widgets/trending_news_tile.dart';
import 'package:page_transition/page_transition.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.sizeOf(context).height * 0.001,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.sizeOf(context).width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trending',
                        style: TextStyle(
                            color: MyColors.isLightTheme == true ? MyColors.black : MyColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      TextButton(
                          onPressed: () => Navigator.push(context, PageTransition(child: Trending(), type: PageTransitionType.fade)),
                          child: Text(
                            'See all',
                            style: TextStyle(
                                color: MyColors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ))
                    ],
                  ),
                ),
              ),
              TrendingNewsTile(
                index: 0,
              ),  
                  Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.sizeOf(context).width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Latest',
                        style: TextStyle(
                            color:  MyColors.isLightTheme == true ? MyColors.black : MyColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      TextButton(
                          onPressed: () => Navigator.push(context, PageTransition(child: HomePageLatestNews(), type: PageTransitionType.fade)),
                          child: Text(
                            'See all',
                            style: TextStyle(
                                color: MyColors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ))
                    ],
                  ),
                ),
                SourcesList(
                  itemCount: 8,
                )
    ],);
  }
}