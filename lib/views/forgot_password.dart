import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/forgot_password_provider.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/views/submit_forgot_password.dart';
import 'package:flutter_news_app/widgets/custom_button.dart';
import 'package:flutter_news_app/widgets/password_reset.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyColors.currentTheme = Theme.of(context).scaffoldBackgroundColor;
    MyColors.isLightTheme =
        MyColors.currentTheme == MyColors.white ? true : false;
    return Consumer<ForgotPasswordProvider>(
      builder: (context, ref, child) => Scaffold(
        floatingActionButton:  CustomButton(
              onPressed: () => Navigator.push(
          context,
          PageTransition(
              child: SubmitForgotPassword(),
              type: PageTransitionType.fade)),
              text: 'Submit',
            ),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.05,
                vertical: MediaQuery.sizeOf(context).height * 0.075),
            child: Container(
                height: MediaQuery.sizeOf(context).height * 0.65,
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        borderRadius: BorderRadius.circular(20),
                        splashColor: MyColors.blue,
                        onTap: () => Navigator.pop(context),
                        child:
                            Icon(Icons.arrow_back, color: MyColors.greyBack)),
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
                        "Don't worry! it happens. Please select the\nemail or number associated with your\naccount.",
                        style: TextStyle(
                            color: MyColors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.sizeOf(context).height * 0.0185),
                        child: PasswordReset(
                          radioPadding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.125),
                          icon: Icons.email_outlined,
                          methodText: 'Via Email:',
                          text: 'example@youremail.com',
                          value:
                              ref.emailSelected,
                          groupValue:
                              ref.restoreMethod,
                          onChanged: (value) =>ref.changeSelection(value),
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.sizeOf(context).height * 0.025),
                        child: PasswordReset(
                          radioPadding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.185),
                          icon: Icons.sms_outlined,
                          methodText: 'Via SMS:',
                          text: '+62-8421-4512-2531',
                          value:
                              ref.smsSelected,
                          groupValue:
                              ref.restoreMethod,
                          onChanged: (value) => ref.changeSelection(value),
                        )),
                  ],
                ))),
      ])),
    );
  }
}
