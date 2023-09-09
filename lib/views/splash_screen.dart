import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_news_app/services/preference_service.dart';
import 'package:flutter_news_app/views/home_page.dart';
import 'package:flutter_news_app/views/onboarding_one.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => SP.preferences!.getString("email") == null
            ? Navigator.pushReplacement(
                context,
                PageTransition(
                    child: OnBoardingOne(), type: PageTransitionType.fade))
            : Navigator.pushReplacement(
                context,
                PageTransition(
                    child: Homepage(), type: PageTransitionType.fade)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * 0.25,
              horizontal: MediaQuery.sizeOf(context).width * 0.1),
          child: Image.asset('assets/logo.png'),
        )
      ],
    ));
  }
}
