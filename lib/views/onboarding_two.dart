import 'package:flutter/material.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/views/onboarding_three.dart';
import 'package:flutter_news_app/widgets/back_button.dart';
import 'package:flutter_news_app/widgets/intro_text_one.dart';
import 'package:flutter_news_app/widgets/intro_text_two.dart';
import 'package:flutter_news_app/widgets/next_button.dart';
import 'package:page_transition/page_transition.dart';

class OnBoardingTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyColors.currentTheme = Theme.of(context).scaffoldBackgroundColor;
    MyColors.isLightTheme =
        MyColors.currentTheme == MyColors.white ? true : false;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/newsimage2.png',
            height: MediaQuery.sizeOf(context).height * 0.6,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.05),
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.30,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height * 0.05),
                      child: IntroTextOne()),
                  IntroTextTwo()
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.05),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: CircleAvatar(
                            backgroundColor: MyColors.grey, minRadius: 8),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: CircleAvatar(
                            backgroundColor: MyColors.blue, minRadius: 8),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: CircleAvatar(
                            backgroundColor: MyColors.grey, minRadius: 8),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomBackButton(),
                      NextButton(
                          onPressed: () => Navigator.push(
                              context,
                              PageTransition(
                                  child: OnBoardingThree(),
                                  type: PageTransitionType.rightToLeft)))
                    ],
                  )
                ]),
          )
        ],
      ),
    );
  }
}
