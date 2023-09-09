import 'package:flutter/material.dart';
import 'package:flutter_news_app/style/colors.dart';

class IntroTextOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Lorem Ipsum is simply\ndummy",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: MyColors.isLightTheme! ? MyColors.black : MyColors.white));
  }
}
