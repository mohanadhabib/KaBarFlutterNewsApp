// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/select_country_provider.dart';
import 'package:flutter_news_app/models/country_model.dart';
import 'package:flutter_news_app/views/select_topics.dart';
import 'package:flutter_news_app/widgets/custom_button.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SelectCountry extends StatelessWidget {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    MyColors.currentTheme = Theme.of(context).scaffoldBackgroundColor;
    MyColors.isLightTheme =
        MyColors.currentTheme == MyColors.white ? true : false;
    return Consumer<SelectCountryProvider>(
     builder: (context, ref, child) =>  
     Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: CustomButton(
          onPressed: () {
            Navigator.push(context, PageTransition(child: SelectTopics(), type: PageTransitionType.fade));
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
                                left: MediaQuery.sizeOf(context).width * 0.175),
                            child: Text(
                              'Select your Country',
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
                          controller:
                              ref.countrySearch,
                          style:
                              TextStyle(fontSize: 16, color: MyColors.greySearch),
                          cursorColor: MyColors.greySearch,
                          onChanged: (value) {
                            if (ref
                                    
                                    .countrySearch!
                                    .text ==
                                0) {
                              ref.getResponse();
                            } else {
                              ref.getSearch(ref
                                  .countrySearch!
                                  .text);
                            }
                            ref.updateState();
                          },
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                                fontSize: 16, color: MyColors.greySearch),
                            suffixIcon: InkWell(
                              onTap: () =>
                                  ref.updateState(),
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
                          padding: EdgeInsets.only(
                              top: MediaQuery.sizeOf(context).height * 0.03),
                          child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.65,
                              width: MediaQuery.sizeOf(context).width,
                              child: FutureBuilder<List<Country>>(
                                  future: ref
                                              .countrySearch!
                                              .text
                                              .length ==
                                          0
                                      ? ref
                                          .getResponse()
                                      : ref
                                          .getSearch(ref
                                              .countrySearch!
                                              .text),
                                  builder: (context, snapshot) => snapshot
                                              .connectionState ==
                                          ConnectionState.waiting
                                      ? Container(
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        )
                                      : ScrollablePositionedList.builder(
                                          itemScrollController: ref
                                              .scrollController,
                                          itemCount: snapshot.data!.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              child: InkWell(
                                                onTap: () async {
                                                  selectedIndex = index;
                                                  ref
                                                      .storeCountryName(snapshot
                                                          .data![index]
                                                          .name!
                                                          .common!);
                                                  await ref
                                                      .scrollToIndex(index);
                                                },
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.075,
                                                  decoration: BoxDecoration(
                                                    color: selectedIndex == index
                                                        ? MyColors.blue
                                                        : null,
                                                    borderRadius:
                                                        BorderRadius.circular(8),
                                                  ),
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                          .width,
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: 10),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.15,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.05,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .rectangle,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              image: DecorationImage(
                                                                  image: NetworkImage(
                                                                      snapshot
                                                                          .data![
                                                                              index]
                                                                          .flags!
                                                                          .png!),
                                                                  fit: BoxFit
                                                                      .fill)),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: 20),
                                                        child: Text(
                                                          snapshot.data![index]
                                                              .name!.common!,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              color: selectedIndex ==
                                                                      index
                                                                  ? MyColors.white
                                                                  : MyColors
                                                                      .greySearch),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          })))),
                    ]),
              )),
        ]),
      ),
    );
  }
}
