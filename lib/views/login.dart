import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/login_provider.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/views/forgot_password.dart';
import 'package:flutter_news_app/views/select_country.dart';
import 'package:flutter_news_app/views/signup.dart';
import 'package:flutter_news_app/widgets/button.dart';
import 'package:flutter_news_app/widgets/social_login_button.dart';
import 'package:flutter_news_app/widgets/user_info_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyColors.currentTheme = Theme.of(context).scaffoldBackgroundColor;
    MyColors.isLightTheme =
        MyColors.currentTheme == MyColors.white ? true : false;
    return Consumer<LoginProvider>(
      builder:(context, ref, child) =>
       WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * 0.05,
                      vertical: MediaQuery.sizeOf(context).height * 0.075),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello',
                            style: TextStyle(
                                color: MyColors.isLightTheme!
                                    ? MyColors.black
                                    : MyColors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 50)),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.sizeOf(context).height * 0.01),
                          child: Text('Again!',
                              style: TextStyle(
                                  color: MyColors.blue,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 55)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.sizeOf(context).height * 0.01),
                          child: Text(
                            "Welcome back you've \nbeen missed",
                            style: TextStyle(
                                color: MyColors.grey,
                                fontWeight: FontWeight.w300,
                                fontSize: 22),
                          ),
                        ),
                        Form(
                            key: ref.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: MediaQuery.sizeOf(context).height *
                                            0.025),
                                    child: UserInfoTextField(
                                      validator: (value) => ref
                                          .usernameValidation(value),
                                      controller:
                                          ref.username,
                                      fillColor: ref
                                              .isUsernameValid!
                                          ? MyColors.greyDark
                                          : MyColors.white,
                                      label: Text('Username'),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.sizeOf(context).height *
                                          0.035,
                                    ),
                                    child: UserInfoTextField(
                                      validator: (value) => ref
                                          .passwordValidation(value),
                                      controller:
                                          ref.password,
                                      fillColor: ref
                                              .isPasswordValid!
                                          ? MyColors.greyDark
                                          : MyColors.white,
                                      label: Text('Password'),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.sizeOf(context).height *
                                          0.015),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 24.0,
                                            height: 24.0,
                                            child: Checkbox(
                                                checkColor: MyColors.isLightTheme!
                                                    ? MyColors.white
                                                    : MyColors.black,
                                                activeColor: MyColors.blue,
                                                value: ref
                                                    .isChecked!,
                                                onChanged: (value) => ref
                                                    .checkTheBox(value)),
                                          ),
                                          Text(
                                            ' Remember me',
                                            style: TextStyle(
                                              color: MyColors.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                      TextButton(
                                          onPressed: () => Navigator.push(
                                              context,
                                              PageTransition(
                                                  child: ForgotPassword(),
                                                  type: PageTransitionType.fade)),
                                          child: Text('Forgot the password?',
                                              style: TextStyle(
                                                color: MyColors.blue,
                                              )))
                                    ],
                                  ),
                                )
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.sizeOf(context).height * 0.025),
                            child: Button(
                                onPressed: () async{
                                  ref.valdiation();
                                  await ref.signIn(context);
                                },
                                text: 'Login')),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.sizeOf(context).height * 0.025),
                          child: Text('or continue with',
                              style:
                                  TextStyle(color: MyColors.grey, fontSize: 16)),
                        )),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.sizeOf(context).height * 0.02),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        right: MediaQuery.sizeOf(context).width *
                                            0.1),
                                    child: SocialLoginButton(
                                      onTap: () {},
                                      icon: FontAwesomeIcons.facebook,
                                      iconColor: MyColors.blue,
                                      text: 'Facebook',
                                    )),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: MediaQuery.sizeOf(context).width *
                                            0.1),
                                    child: SocialLoginButton(
                                      onTap: () {
                                        ref
                                            .signInWithGoogle();
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                child: SelectCountry(),
                                                type: PageTransitionType.fade));
                                      },
                                      icon: FontAwesomeIcons.google,
                                      text: 'Google',
                                    )),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.sizeOf(context).height * 0.02),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("don't have an account ?",
                                    style: TextStyle(color: MyColors.grey)),
                                TextButton(
                                    onPressed: () => Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                            child: SignUp(),
                                            type: PageTransitionType.fade)),
                                    child: Text('Sign Up'))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
