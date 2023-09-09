import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/home_page_provider.dart';
import 'package:flutter_news_app/services/preference_service.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/views/edit_profile.dart';
import 'package:flutter_news_app/widgets/bookmark_tile.dart';
import 'package:flutter_news_app/widgets/bottom_nav_bar.dart';
import 'package:flutter_news_app/widgets/button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    setState(() { });
  }
  @override
  Widget build(BuildContext context) {
    int currentIndex = 3;
    MyColors.currentTheme = Theme.of(context).scaffoldBackgroundColor;
    MyColors.isLightTheme =
        MyColors.currentTheme == MyColors.white ? true : false;
    return Scaffold(
      bottomNavigationBar: BottomNav(currentIndex: currentIndex),
      body: Consumer<HomePageProvider>(
        builder: (context, ref, child) => Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 0.035,
                left: MediaQuery.sizeOf(context).width * 0.045,
                right: MediaQuery.sizeOf(context).width * 0.045),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.sizeOf(context).height * 0.045),
                    child: Text(
                      "Profile",
                      style: TextStyle(
                          fontSize: 16,
                          color: MyColors.isLightTheme!
                              ? MyColors.black
                              : MyColors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.sizeOf(context).height * 0.025,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 45,
                          backgroundImage: CachedNetworkImageProvider(
                              SP.preferences!.getString('imgUrl')!)),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.sizeOf(context).width * 0.1),
                        child: Column(
                          children: [
                            Text('0',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: MyColors.isLightTheme!
                                        ? MyColors.black
                                        : MyColors.white)),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text('Followers',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: MyColors.isLightTheme!
                                          ? MyColors.black
                                          : MyColors.white)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.sizeOf(context).width * 0.05),
                        child: Column(
                          children: [
                            Text('0',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: MyColors.isLightTheme!
                                        ? MyColors.black
                                        : MyColors.white)),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text('Following',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: MyColors.isLightTheme!
                                          ? MyColors.black
                                          : MyColors.white)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.sizeOf(context).width * 0.05),
                        child: Column(
                          children: [
                            Text('3',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: MyColors.isLightTheme!
                                        ? MyColors.black
                                        : MyColors.white)),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text('News',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: MyColors.isLightTheme!
                                          ? MyColors.black
                                          : MyColors.white)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(SP.preferences!.getString('fullname')!,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: MyColors.isLightTheme!
                                ? MyColors.black
                                : MyColors.white)),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                           SP.preferences!.getString("bio") == null ? 'Lorem Ipsum is simply dummy text of the ' : SP.preferences!.getString("bio")! ,
                          style: TextStyle(
                              fontSize: 15,
                              color: MyColors.isLightTheme!
                                  ? MyColors.black
                                  : MyColors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                          SP.preferences!.getString("website") == null ? 'printing and typesetting industry' : SP.preferences!.getString("website")! ,
                          style: TextStyle(
                              fontSize: 15,
                              color: MyColors.isLightTheme!
                                  ? MyColors.black
                                  : MyColors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Button(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: EditProfile(),
                                    type: PageTransitionType.fade));
                          },
                          text: 'Edit profile'),
                    )
                  ],
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text('Saved News',
                        style: TextStyle(
                            fontSize: 15,
                            color: MyColors.isLightTheme!
                                ? MyColors.black
                                : MyColors.white)),
                  ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.445,
                  child: ref.articles.isEmpty
                      ? Container()
                      : ListView(
                          children: [
                            ...ref.articles
                                .map((e) => Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: InkWell(
                                        onTap: () async {
                                          await ref
                                              .openNewsInWeb(Uri.parse(e.url!));
                                        },
                                        child: BookmarkTile(
                                            imgUrl: e.urlToImage!,
                                            title: e.title!,
                                            sourceName: e.source!.name!,
                                            publishedAt: e.publishedAt!),
                                      ),
                                    ))
                                .toList()
                          ],
                        ),
                )
              ],
            )),
      ),
    );
  }
}
