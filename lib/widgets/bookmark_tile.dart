// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/home_page_provider.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:provider/provider.dart';

class BookmarkTile extends StatelessWidget {
  String imgUrl;
  String title;
  String sourceName;
  String publishedAt;
  BookmarkTile({super.key,required this.imgUrl,required this.title,required this.sourceName,required this.publishedAt});
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, ref, child) => 
       Padding(
        padding: EdgeInsets.only(bottom: 15, left: 10, right: 10),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 0.235,
                height: MediaQuery.sizeOf(context).height * 0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image:
                        DecorationImage(image: CachedNetworkImageProvider(imgUrl), fit: BoxFit.fill)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                         ref.country!,
                          style: TextStyle(
                              color: MyColors.greyText,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.555,
                          child: Text(title.split("-")[0],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: MyColors.isLightTheme == true
                                      ? MyColors.black
                                      : MyColors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Row(
                          children: [
                            Text(
                              sourceName,
                              style: TextStyle(
                                  color: MyColors.greyText,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 5),
                              child: Icon(
                                Icons.access_time,
                                size: 15,
                                color: MyColors.greyText,
                              ),
                            ),
                            Text(
                                ref.calculateTime(publishedAt),
                                style: TextStyle(
                                    color: MyColors.greyText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400))
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
    );
  }
}
