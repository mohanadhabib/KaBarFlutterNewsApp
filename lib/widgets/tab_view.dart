// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/home_page_provider.dart';
import 'package:flutter_news_app/models/news_model.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class TabView extends StatefulWidget {
  int? itemCount;
  Future<News>? future;
  TabView({this.itemCount, this.future});
  @override
  State<StatefulWidget> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, ref, child) => 
         Container(
            width: MediaQuery.sizeOf(context).width,
            child: FutureBuilder<News>(
                future: widget.future,
                builder: (context, snapshot) => snapshot.data == null ? Container() : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: widget.itemCount,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () async {
                            await ref.openNewsInWeb(
                                Uri.parse(snapshot.data!.articles![index].url!));
                          },
                          onLongPress: () async{
                            await ref.addToBookmark(snapshot.data!.articles![index]);
                            Fluttertoast.showToast(msg: "Added To Bookmarks Successfully",
                             backgroundColor: MyColors.grey,
                             gravity: ToastGravity.BOTTOM,
                             toastLength: Toast.LENGTH_LONG);
                            ref.getBookmarks();
                          },
                          child: Padding(
                            padding:
                                EdgeInsets.only(bottom: 15, left: 10, right: 10),
                            child: snapshot.connectionState ==
                                    ConnectionState.waiting
                                ? Container(
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        snapshot.data!.articles![index]
                                                    .urlToImage !=
                                                null
                                            ? Container(
                                                width: MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.235,
                                                height: MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.1,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(8),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          snapshot
                                                              .data!
                                                              .articles![index]
                                                              .urlToImage!,
                                                        ),
                                                        fit: BoxFit.fill)),
                                              )
                                            : Container(
                                                width: MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.235,
                                                height: MediaQuery.sizeOf(context)
                                                        .height *
                                                    0.1,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: MyColors.grey,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Center(
                                                        child: Padding(
                                                      padding:
                                                          EdgeInsets.only(left: 5),
                                                      child: Text(
                                                        'No image',
                                                        style: TextStyle(
                                                            color: MyColors.white),
                                                      ),
                                                    )),
                                                  ],
                                                ),
                                              ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    ref
                                                        .country!,
                                                    style: TextStyle(
                                                        color: MyColors.greyText,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.sizeOf(context)
                                                                .width *
                                                            0.555,
                                                    child: Text(
                                                        snapshot.data!
                                                            .articles![index].title!
                                                            .split("-")[0],
                                                        maxLines: 2,
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                            color: MyColors
                                                                        .isLightTheme ==
                                                                    true
                                                                ? MyColors.black
                                                                : MyColors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 6),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        snapshot
                                                            .data!
                                                            .articles![index]
                                                            .source!
                                                            .name!,
                                                        style: TextStyle(
                                                            color:
                                                                MyColors.greyText,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: 10, right: 5),
                                                        child: Icon(
                                                          Icons.access_time,
                                                          size: 15,
                                                          color: MyColors.greyText,
                                                        ),
                                                      ),
                                                      Text(
                                                          ref
                                                              .calculateTime(snapshot
                                                                  .data!
                                                                  .articles![index]
                                                                  .publishedAt!),
                                                          style: TextStyle(
                                                              color:
                                                                  MyColors.greyText,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.w400))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                          ),
                        )))),
       );
  }
}
