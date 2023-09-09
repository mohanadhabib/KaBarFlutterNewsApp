// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/home_page_provider.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/views/bookmarks_page.dart';
import 'package:flutter_news_app/views/home_page.dart';
import 'package:flutter_news_app/views/profile_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  int? currentIndex;
  BottomNav({this.currentIndex});
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    MyColors.currentTheme = Theme.of(context).scaffoldBackgroundColor;
    MyColors.isLightTheme =
        MyColors.currentTheme == MyColors.white ? true : false;
    return BottomNavigationBar(
        iconSize: 22,
        selectedItemColor: MyColors.blue,
        selectedLabelStyle:
            TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        unselectedItemColor: MyColors.greyText,
        unselectedLabelStyle:
            TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        showUnselectedLabels: true,
        elevation: 10,
        onTap: (value) {
          setState(() {
            widget.currentIndex = value;
            if (widget.currentIndex == 0 || widget.currentIndex == 1) {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: Homepage(), type: PageTransitionType.fade));
            }
            if (widget.currentIndex == 2) {
              if (Provider.of<HomePageProvider>(context, listen: false)
                  .articles
                  .isEmpty) {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: BookmarksPage(), type: PageTransitionType.fade));
              } else {
                Provider.of<HomePageProvider>(context, listen: false)
                    .getBookmarks();
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: BookmarksPage(), type: PageTransitionType.fade));
              }
            }
            if (widget.currentIndex == 3) {
              if (Provider.of<HomePageProvider>(context, listen: false)
                  .articles
                  .isEmpty) {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: ProfilePage(), type: PageTransitionType.fade));
              } else {
                Provider.of<HomePageProvider>(context, listen: false)
                    .getBookmarks();
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: ProfilePage(), type: PageTransitionType.fade));
              }
            }
          });
        },
        currentIndex: widget.currentIndex!,
        items: [
          BottomNavigationBarItem(
            backgroundColor:
                MyColors.isLightTheme == true ? MyColors.white : MyColors.black,
            icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Icon(Icons.home_outlined)),
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor:
                MyColors.isLightTheme == true ? MyColors.white : MyColors.black,
            icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Icon(Icons.explore_outlined)),
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Icon(Icons.explore),
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            backgroundColor:
                MyColors.isLightTheme == true ? MyColors.white : MyColors.black,
            icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Icon(Icons.bookmark_border_rounded)),
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Icon(Icons.bookmark),
            ),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            backgroundColor:
                MyColors.isLightTheme == true ? MyColors.white : MyColors.black,
            icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Icon(Icons.account_circle_outlined)),
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Icon(Icons.account_circle_rounded),
            ),
            label: 'Profile',
          )
        ]);
  }
}
