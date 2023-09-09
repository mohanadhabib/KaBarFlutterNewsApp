// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_news_app/style/colors.dart';

class GetStartButton extends StatelessWidget {
  void Function()? onPressed;

  GetStartButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 55,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: MyColors.blue,
      splashColor: MyColors.blue,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "Get Started",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: MyColors.white),
        ),
      ),
    );
  }
}
