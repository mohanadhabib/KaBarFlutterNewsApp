import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/select_topics_provider.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/views/fill_profile.dart';
import 'package:flutter_news_app/widgets/custom_button.dart';
import 'package:flutter_news_app/widgets/topic_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SelectTopics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyColors.currentTheme = Theme.of(context).scaffoldBackgroundColor;
    MyColors.isLightTheme =
        MyColors.currentTheme == MyColors.white ? true : false;
    return Consumer<SelectTopicsProvider>(
       builder: (context, ref, child) =>
       Scaffold(
          floatingActionButton: CustomButton(
            onPressed: () async {
              await ref.storeTopics();
              Navigator.push(context, PageTransition(child: FillProfile(), type: PageTransitionType.fade));
            },
            text: 'Next',
          ),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.sizeOf(context).width * 0.05,
                    right: MediaQuery.sizeOf(context).width * 0.05,
                    top: MediaQuery.sizeOf(context).height * 0.075,
                    bottom: MediaQuery.sizeOf(context).height * 0.025),
                child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  splashColor: MyColors.blue,
                                  onTap: () => Navigator.pop(context),
                                  child: Icon(Icons.arrow_back,
                                      color: MyColors.greyBack)),
                              Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.sizeOf(context).width * 0.175),
                                child: Text(
                                  'Choose your Topics',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: MyColors.isLightTheme!
                                          ? MyColors.black
                                          : MyColors.greySearch),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.sizeOf(context).height * 0.02),
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 16, color: MyColors.greySearch),
                              cursorColor: MyColors.greySearch,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                    fontSize: 16, color: MyColors.greySearch),
                                suffixIcon: InkWell(
                                  onTap: () {},
                                  child: Icon(Icons.search_rounded,
                                      color: MyColors.greySearch, size: 30),
                                ),
                                filled: MyColors.isLightTheme! ? false : true,
                                fillColor: MyColors.greyDark,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: MyColors.isLightTheme!
                                            ? MyColors.greySearch
                                            : MyColors.greyDark)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: MyColors.isLightTheme!
                                            ? MyColors.greySearch
                                            : MyColors.greyDark)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height*0.02),
                            child: Container(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              TopicButton(text:'National',isFirst: true),
                                              TopicButton(text:'International',isFirst: false),
                                              TopicButton(text:'Sport',isFirst: false)
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top:MediaQuery.sizeOf(context).height*0.01),
                                            child: Row(
                                              children: [
                                                TopicButton(text:'Lifestyle',isFirst: true),
                                                TopicButton(text:'Business',isFirst: false),
                                                TopicButton(text:'Health',isFirst: false)
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top:MediaQuery.sizeOf(context).height*0.01),
                                            child: Row(
                                              children: [
                                                TopicButton(text: 'Fashion',isFirst: true),
                                                TopicButton(text: 'Technology',isFirst: false),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top:MediaQuery.sizeOf(context).height*0.01),
                                            child: Row(
                                              children: [
                                                TopicButton(text: 'Science',isFirst: true),
                                                TopicButton(text: 'Art',isFirst: false,),
                                                TopicButton(text: 'Politics',isFirst: false,),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                          )
                        ]))),
          ])),
    );
  }
}
