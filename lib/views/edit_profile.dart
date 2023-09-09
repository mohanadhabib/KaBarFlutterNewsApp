import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/edit_profile_provider.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/views/profile_page.dart';
import 'package:flutter_news_app/widgets/user_info_text_field.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    MyColors.currentTheme = Theme.of(context).scaffoldBackgroundColor;
    MyColors.isLightTheme =
        MyColors.currentTheme == MyColors.white ? true : false;
    return Consumer<EditProfileProvider>(
      builder: (context, ref, child) =>
       Scaffold(
          body: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                                          MediaQuery.sizeOf(context).width * 0.245),
                                  child: Text(
                                    'Fill your Profile',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: MyColors.isLightTheme!
                                            ? MyColors.black
                                            : MyColors.greySearch),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left:
                                          MediaQuery.sizeOf(context).width * 0.205),
                                  child: InkWell(
                                      borderRadius: BorderRadius.circular(20),
                                      splashColor: MyColors.blue,
                                      onTap: () async{
                                        await ref.storeInfo();
                                        Navigator.pushReplacement(context,PageTransition(child: ProfilePage(), type: PageTransitionType.fade));
                                        ref.update();
                                      },
                                      child: Icon(Icons.done,
                                          color: MyColors.greyBack)),
                                ),
                              ],
                            ),
                            Center(
                                child: Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.sizeOf(context).height * 0.025),
                              child: Stack(children: [
                                ref.imgFile == null
                                    ? CircleAvatar(
                                        backgroundColor: MyColors.greyLight,
                                        radius:
                                            MediaQuery.sizeOf(context).width * 0.2,
                                      )
                                    : CircleAvatar(
                                        backgroundImage: FileImage(
                                            ref.imgFile!),
                                        backgroundColor: MyColors.greyLight,
                                        radius:
                                            MediaQuery.sizeOf(context).width * 0.2,
                                      ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.sizeOf(context).height * 0.13,
                                      left:
                                          MediaQuery.sizeOf(context).width * 0.24),
                                  child: MaterialButton(
                                      color: MyColors.blue,
                                      minWidth: 5,
                                      height: 45,
                                      onPressed: () async {
                                        await ref.getImage();
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(35)),
                                      child: Icon(Icons.add_a_photo_outlined,
                                          color: MyColors.white, size: 16)),
                                )
                              ]),
                            )),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.sizeOf(context).height * 0.03),
                              child: UserInfoTextField(
                                controller: ref.username,
                                fillColor: MyColors.isLightTheme == true
                                    ? MyColors.white
                                    : MyColors.greyDark,
                                label: Text('Username'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.sizeOf(context).height * 0.03),
                              child: UserInfoTextField(
                                controller: ref.fullname,
                                fillColor: MyColors.isLightTheme == true
                                    ? MyColors.white
                                    : MyColors.greyDark,
                                label: Text('Full Name'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.sizeOf(context).height * 0.03),
                              child: UserInfoTextField(
                                controller: ref.email,
                                fillColor: MyColors.isLightTheme == true
                                    ? MyColors.white
                                    : MyColors.greyDark,
                                label: Text('Email Address'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.sizeOf(context).height * 0.03),
                              child: UserInfoTextField(
                                controller:
                                    ref.phoneNumber,
                                fillColor: MyColors.isLightTheme == true
                                    ? MyColors.white
                                    : MyColors.greyDark,
                                label: Text('Phone Number'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.sizeOf(context).height * 0.03),
                              child: UserInfoTextField(
                                controller: ref.bio,
                                fillColor: MyColors.isLightTheme == true
                                    ? MyColors.white
                                    : MyColors.greyDark,
                                label: Text('Bio'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.sizeOf(context).height * 0.03),
                              child: UserInfoTextField(
                                controller: ref.website,
                                fillColor: MyColors.isLightTheme == true
                                    ? MyColors.white
                                    : MyColors.greyDark,
                                label: Text('Website'),
                              ),
                            ),
                          ]))),
            ]),
          )),
    );
  }
}