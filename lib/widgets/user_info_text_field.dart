// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_news_app/style/colors.dart';

class UserInfoTextField extends StatelessWidget {
  String? Function(String?)? validator;
  TextEditingController? controller;
  Color? fillColor;
  Widget? label;
  Key? key;

  UserInfoTextField(
      {this.key, this.validator, this.controller, this.fillColor, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height*0.08,
      child: TextFormField(
        validator: validator,
        controller: controller,
        cursorColor: MyColors.grey,
        decoration: InputDecoration(
            filled: MyColors.isLightTheme! ? false : true,
            fillColor: fillColor,
            label: label,
            labelStyle: TextStyle(color: MyColors.grey),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: MyColors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: MyColors.blue)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: MyColors.redError))),
      ),
    );
  }
}
