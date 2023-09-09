// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/home_page_provider.dart';
import 'package:flutter_news_app/models/news_model.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:provider/provider.dart';

class TrendingNewsTile extends StatelessWidget {
  int? index = 0;
  TrendingNewsTile({this.index});
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
        builder: (context, ref, child) => FutureBuilder<News>(
            future: ref.getNews(
                "https://newsapi.org/v2/everything?q=us&apiKey=4f5c7ab474bc4dd9b26ffc259bd23e31"),
            builder: (context, snapshot) => snapshot.data == null
                ? Container()
                : snapshot.connectionState == ConnectionState.waiting
                    ? Padding(
                        padding: EdgeInsets.all(100),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: MyColors.blue,
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () async {
                          await ref.openNewsInWeb(
                              Uri.parse(snapshot.data!.articles![index!].url!));
                        },
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                snapshot.data!.articles![index!].urlToImage !=
                                        null
                                    ? Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.25,
                                        width: MediaQuery.sizeOf(context).width,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(snapshot
                                                    .data!
                                                    .articles![index!]
                                                    .urlToImage!),
                                                fit: BoxFit.fill),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      )
                                    : Container(
                                        child: Text('There is no image'),
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.25,
                                        width: MediaQuery.sizeOf(context).width,
                                        decoration: BoxDecoration(
                                            color: MyColors.grey,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    ref.country!,
                                    style: TextStyle(
                                        color: MyColors.greyText,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    snapshot.data!.articles![index!].title!
                                        .split("-")[0],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: MyColors.isLightTheme == true
                                            ? MyColors.black
                                            : MyColors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Row(
                                    children: [
                                      Text(
                                        snapshot.data!.articles![index!].source!
                                            .name!,
                                        style: TextStyle(
                                            color: MyColors.greyText,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 10, right: 5),
                                        child: Icon(
                                          Icons.access_time,
                                          size: 15,
                                          color: MyColors.greyText,
                                        ),
                                      ),
                                      Text(
                                          ref.calculateTime(snapshot.data!
                                              .articles![index!].publishedAt!),
                                          style: TextStyle(
                                              color: MyColors.greyText,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )));
  }
}
