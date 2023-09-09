import 'package:flutter/material.dart';
import 'package:flutter_news_app/style/colors.dart';

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text("Back",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: MyColors.grey)));
  }
}
