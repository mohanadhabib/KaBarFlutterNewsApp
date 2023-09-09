// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_news_app/style/colors.dart';

class TopicButton extends StatefulWidget {
  String? text;
  bool? isFirst;
  static List<String> topics = List.empty(growable: true);

  TopicButton({this.text, this.isFirst});

  @override
  State<TopicButton> createState() => _TopicButtonState();
}

class _TopicButtonState extends State<TopicButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    MyColors.currentTheme = Theme.of(context).scaffoldBackgroundColor;
    MyColors.isLightTheme =
        MyColors.currentTheme == MyColors.white ? true : false;
    return Padding(
      padding: this.widget.isFirst == true
          ? EdgeInsets.all(0)
          : EdgeInsets.only(left: 11),
      child: InkWell(
        onTap: () {
          setState(() {
            this.isSelected = !this.isSelected;
            if (this.isSelected == true) {
              TopicButton.topics.add(this.widget.text!);
            } else {
              TopicButton.topics.remove(this.widget.text!);
            }
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: this.isSelected == true
                ? MyColors.blue
                : MyColors.isLightTheme == true
                    ? MyColors.white
                    : MyColors.black,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: MyColors.blue),
          ),
          child: Center(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 22),
            child: Text(
              this.widget.text!,
              style: TextStyle(
                  color:
                      this.isSelected == true ? MyColors.white : MyColors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          )),
        ),
      ),
    );
  }
}
