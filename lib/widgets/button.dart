// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_news_app/style/colors.dart';
class Button extends StatelessWidget {
  String? text;
  void Function()? onPressed;
  Button({this.onPressed, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height*0.065,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text!,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: MyColors.white),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: MyColors.blue,
        height: MediaQuery.sizeOf(context).height * 0.055,
        minWidth: MediaQuery.sizeOf(context).width,
      ),
    );
  }
}