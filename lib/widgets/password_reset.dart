// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_news_app/style/colors.dart';

class PasswordReset extends StatelessWidget {
  IconData? icon;
  String? methodText;
  String? text;
  dynamic value, groupValue;
  EdgeInsetsGeometry? radioPadding;
  void Function(dynamic)? onChanged;

  PasswordReset(
      {this.icon,
      this.methodText,
      this.text,
      this.value,
      this.groupValue,
      this.onChanged,
      this.radioPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.125,
      decoration: BoxDecoration(
          color: MyColors.greyLight, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.035,
                vertical: MediaQuery.sizeOf(context).height * 0.025),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.165,
              height: MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(
                  color: MyColors.blue, borderRadius: BorderRadius.circular(8)),
              child: Icon(
                icon,
                color: MyColors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.sizeOf(context).height * 0.025),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  methodText!,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: MyColors.greyText),
                ),
                Text(
                  text!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding:radioPadding!,
            child: Radio(
              activeColor: MyColors.blue,
              splashRadius: 20,
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
          )
        ],
      ),
    );
  }
}
