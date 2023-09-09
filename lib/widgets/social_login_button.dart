// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_news_app/style/colors.dart';

class SocialLoginButton extends StatelessWidget {
  void Function()? onTap;
  IconData? icon;
  Color? iconColor;
  String? text;
  SocialLoginButton({this.onTap, this.icon, this.iconColor, this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: MyColors.greyLight, borderRadius: BorderRadius.circular(8)),
        height: MediaQuery.sizeOf(context).height * 0.055,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Icon(icon, color: iconColor),
          Text(
            text!,
            style: TextStyle(
                color: MyColors.greyText,
                fontWeight: FontWeight.w800,
                fontSize: 15),
          )
        ]),
      ),
    );
  }
}
