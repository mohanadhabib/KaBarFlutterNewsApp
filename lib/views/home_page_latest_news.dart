import 'package:flutter/material.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/widgets/bottom_nav_bar.dart';
import 'package:flutter_news_app/widgets/sources_list.dart';

class HomePageLatestNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    MyColors.currentTheme = Theme.of(context).scaffoldBackgroundColor;
    MyColors.isLightTheme =
        MyColors.currentTheme == MyColors.white ? true : false;
    return Scaffold(
        bottomNavigationBar: BottomNav(currentIndex: currentIndex),
        body: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 0.03,
                left: MediaQuery.sizeOf(context).width * 0.025,
                right: MediaQuery.sizeOf(context).width * 0.025),
            child: Container(
                child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.295,
                    height: MediaQuery.sizeOf(context).height * 0.085,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/logo.png'),
                            fit: BoxFit.cover)),
                  ),
                  Card(
                    elevation: 2,
                    shadowColor: MyColors.grey,
                    color: MyColors.isLightTheme == true
                        ? MyColors.white
                        : MyColors.greyDark,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.notifications_none_rounded,
                          color: MyColors.isLightTheme == true
                              ? MyColors.greyDark
                              : MyColors.white),
                    ),
                  )
                ],
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
                          color: MyColors.isLightTheme == true
                              ? MyColors.black
                              : MyColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    TextButton(
                        onPressed: () {},
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
              itemCount: 20,
              sourceListHeight: MediaQuery.sizeOf(context).height * 0.7195,
            )
            ]))));
  }
}
