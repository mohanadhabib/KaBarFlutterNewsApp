// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_app/style/colors.dart';

class OTPTextField extends StatelessWidget {
  TextEditingController? controller;
  OTPTextField({this.controller});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width*0.0245),
      child: Container(
          height: 60,
          width: 60,
          child: TextField(
            maxLength: 1,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              controller: controller,
              decoration: InputDecoration(
                  counterText: '',
                  filled: MyColors.isLightTheme! ? false : true,
                  labelStyle: TextStyle(color: MyColors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: MyColors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: MyColors.blue)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: MyColors.redError))))),
    );
  }
}
