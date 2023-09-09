import 'package:flutter/material.dart';
import 'package:flutter_news_app/style/colors.dart';

class IntroTextTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "\nLorem Ipsum is simply dummy text of\nthe printing and typesetting industry.",
      style: TextStyle(
          color: MyColors.grey, fontWeight: FontWeight.normal, fontSize: 18),
    );
  }
}
