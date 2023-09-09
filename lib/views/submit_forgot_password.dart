import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/forgot_password_provider.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/widgets/custom_button.dart';
import 'package:flutter_news_app/widgets/user_info_text_field.dart';
import 'package:provider/provider.dart';

class SubmitForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyColors.currentTheme = Theme.of(context).scaffoldBackgroundColor;
    MyColors.isLightTheme =
        MyColors.currentTheme == MyColors.white ? true : false;
    return Consumer<ForgotPasswordProvider>(
      builder: (context, ref, child) =>  Scaffold(
        floatingActionButton: CustomButton(
          onPressed: () async {},
          text: 'Submit',
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.05,
                    vertical: MediaQuery.sizeOf(context).height * 0.075),
                child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                              borderRadius: BorderRadius.circular(20),
                              splashColor: MyColors.blue,
                              onTap: () => Navigator.pop(context),
                              child: Icon(Icons.arrow_back,
                                  color: MyColors.greyBack)),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.sizeOf(context).height * 0.025),
                            child: Text(
                              'Forgot',
                              style: TextStyle(
                                  color: MyColors.isLightTheme!
                                      ? MyColors.greyBack
                                      : MyColors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 38),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.sizeOf(context).height * 0.0065),
                            child: Text(
                              'Password ?',
                              style: TextStyle(
                                  color: MyColors.isLightTheme!
                                      ? MyColors.greyBack
                                      : MyColors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 38),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.sizeOf(context).height * 0.025),
                            child: Text(
                              "Don't worry! it happens. Please select the\naddress associated with your account.",
                              style: TextStyle(
                                  color: MyColors.grey,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.sizeOf(context).height * 0.025),
                              child: UserInfoTextField(
                                label: Text('Email ID / Mobile number'),
                                key: ref.key,
                                controller: ref
                                    .emailPhone,
                                fillColor: ref
                                        .isPasswordValid!
                                    ? MyColors.greyDark
                                    : MyColors.white,
                              ))
                        ])))
          ],
        ),
      ),
    );
  }
}
