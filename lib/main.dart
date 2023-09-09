import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/edit_profile_provider.dart';
import 'package:flutter_news_app/providers/fill_info_provider.dart';
import 'package:flutter_news_app/providers/forgot_password_provider.dart';
import 'package:flutter_news_app/providers/home_page_provider.dart';
import 'package:flutter_news_app/providers/login_provider.dart';
import 'package:flutter_news_app/providers/select_country_provider.dart';
import 'package:flutter_news_app/providers/select_topics_provider.dart';
import 'package:flutter_news_app/providers/signup_provider.dart';
import 'package:flutter_news_app/services/preference_service.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SP.init();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => FillInfoProvider()),
      ChangeNotifierProvider(create: (context) => ForgotPasswordProvider()),
      ChangeNotifierProvider(create: (context) => HomePageProvider()),
      ChangeNotifierProvider(create: (context) => LoginProvider()),
      ChangeNotifierProvider(create: (context) => SelectCountryProvider()),
      ChangeNotifierProvider(create: (context) => SelectTopicsProvider()),
      ChangeNotifierProvider(create: (context) => SignUpProvider()),
      ChangeNotifierProvider(create: (context) => EditProfileProvider(),)
    ],
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KaBar',
      theme: ThemeData(scaffoldBackgroundColor: MyColors.white),
      darkTheme: ThemeData(scaffoldBackgroundColor: MyColors.black),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
