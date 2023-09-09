import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/services/database_service.dart';
import 'package:flutter_news_app/services/preference_service.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/views/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';

class LoginProvider extends ChangeNotifier {
  bool? isChecked = true;
  bool? isUsernameValid = true;
  bool? isPasswordValid = true;
  TextEditingController? username = TextEditingController();
  TextEditingController? password = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void valdiation() {
    formKey.currentState!.validate();
    notifyListeners();
  }

  void checkTheBox(bool? value) {
    isChecked = value;
    notifyListeners();
  }

  String? usernameValidation(String? value) {
    if (value!.isEmpty) {
      isUsernameValid = false;
      return 'Invalid Username';
    } else {
      isUsernameValid = true;
      return null;
    }
  }

  String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      isPasswordValid = false;
      return 'Invalid Password';
    } else if (value.length < 8) {
      isPasswordValid = false;
      return 'Weak Password, Password must be at least 8 characters';
    } else {
      isPasswordValid = true;
      return null;
    }
  }

  Future<void> signIn(BuildContext context) async {
    try {
      await Database.auth.signInWithEmailAndPassword(
          email: username!.text, password: password!.text);
      if (isChecked == true) {
       await SP.preferences!.setString("email", username!.text);
       await SP.preferences!.setString("password", password!.text);
      }
      Fluttertoast.showToast(
        msg: 'Sign in Successfull',
        backgroundColor: MyColors.grey,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
      );
      Navigator.pushReplacement(context,
          PageTransition(child: Homepage(), type: PageTransitionType.fade));
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Sign in Failed',
        backgroundColor: MyColors.grey,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = await GoogleSignIn();
      GoogleSignInAccount? googleAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth =
          await googleAccount!.authentication;
      AuthCredential authCredential = await GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await Database.auth.signInWithCredential(authCredential);
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error, Something went wrong',
        backgroundColor: MyColors.grey,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
      );
    }
    notifyListeners();
  }
}
