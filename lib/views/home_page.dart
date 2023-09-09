import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/home_page_provider.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/views/home_view.dart';
import 'package:flutter_news_app/views/search_view.dart';
import 'package:flutter_news_app/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';
class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    MyColors.currentTheme = Theme.of(context).scaffoldBackgroundColor;
    MyColors.isLightTheme =
        MyColors.currentTheme == MyColors.white ? true : false;
    return Consumer<HomePageProvider>(
      builder: (context, ref, child) => 
      Scaffold(
        bottomNavigationBar: BottomNav(currentIndex: currentIndex),
        body: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.035,
              left: MediaQuery.sizeOf(context).width * 0.025,
              right: MediaQuery.sizeOf(context).width * 0.025),
          child: Container(
            child: Column(
              children: [
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
                      color: MyColors.isLightTheme == true ? MyColors.white : MyColors.greyDark,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Icon(Icons.notifications_none_rounded,color: MyColors.isLightTheme == true ? MyColors.greyDark : MyColors.white ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.sizeOf(context).height * 0.01,
                      left: MediaQuery.sizeOf(context).width * 0.02,
                      right: MediaQuery.sizeOf(context).width * 0.01),
                  child: TextField(
                    onChanged:(value) {
                      ref.updateState();
                    },
                    controller: ref.searchController,
                    style: TextStyle(fontSize: 16, color: MyColors.greySearch),
                    cursorColor: MyColors.greySearch,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle:
                          TextStyle(fontSize: 16, color: MyColors.greySearch),
                      prefixIcon: Icon(Icons.search_rounded,
                          color: MyColors.greySearch, size: 30),
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
                ref.searchController!.text == ''? HomeView() : SearchView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
