import 'package:flutter/material.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/views/home_page.dart';
import 'package:flutter_news_app/widgets/custom_button.dart';
import 'package:page_transition/page_transition.dart';

class GoToHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyColors.currentTheme = Theme.of(context).scaffoldBackgroundColor;
    MyColors.isLightTheme =
        MyColors.currentTheme == MyColors.white ? true : false;
    return Scaffold(
      floatingActionButton: CustomButton(
        text: 'Go to Homepage',
        onPressed: ()=> Navigator.pushReplacement(context,PageTransition(child: Homepage(), type: PageTransitionType.fade)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.sizeOf(context).height * 0.30),
              child: Column(children: [
                Image.asset('assets/logo.png'),
                Text(
                  'Congratulations!',
                  style: TextStyle(
                      color: MyColors.isLightTheme == true
                          ? MyColors.greyBack
                          : MyColors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('Your account is ready to use',
                      style: TextStyle(
                          color: MyColors.isLightTheme == true
                              ? MyColors.greyBack
                              : MyColors.greyText,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
