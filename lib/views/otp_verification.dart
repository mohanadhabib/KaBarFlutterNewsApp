import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/forgot_password_provider.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/widgets/custom_button.dart';
import 'package:flutter_news_app/widgets/otp_text_field.dart';
import 'package:provider/provider.dart';

class OtpVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyColors.currentTheme = Theme.of(context).scaffoldBackgroundColor;
    MyColors.isLightTheme =
        MyColors.currentTheme == MyColors.white ? true : false;
    return Consumer<ForgotPasswordProvider>(
      builder: (context, ref, child) => Scaffold(
        floatingActionButton: CustomButton(
            onPressed: () async {
            },
            text: 'Verify',
          ),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      Center(
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.sizeOf(context).height *
                                    0.025),
                            child: Text(
                              'OTP Verification',
                              style: TextStyle(
                                  color: MyColors.isLightTheme!
                                      ? MyColors.greyBack
                                      : MyColors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 35),
                            )),
                      ),
                      Center(
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.sizeOf(context).height *
                                    0.025),
                            child: Text(
                              'Enter the OTP sent to ' +
                                  ref
                                      .emailPhone!
                                      .text,
                              style: TextStyle(
                                  color: MyColors.grey,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17),
                            )),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.sizeOf(context).height * 0.025),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height * 0.125,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width*0.025),
                              child: Row(
                                children: [
                                  OTPTextField(controller: ref.pin0),
                                  OTPTextField(controller: ref.pin1),
                                  OTPTextField(controller: ref.pin2),
                                  OTPTextField(controller: ref.pin3)
                                ],
                              ),
                            ),
                          ))
                    ]))),
      ])),
    );
  }
}
