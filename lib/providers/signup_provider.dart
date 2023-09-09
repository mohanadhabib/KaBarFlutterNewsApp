import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/services/database_service.dart';
import 'package:flutter_news_app/services/preference_service.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:flutter_news_app/views/select_country.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';

class SignUpProvider extends ChangeNotifier {
  bool? isChecked = true;
  bool? isUsernameValid = true;
  bool? isPasswordValid = true;
  TextEditingController? username = TextEditingController();
  TextEditingController? password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  void navigateToNextPage(BuildContext context) {
    username!.clear();
    password!.clear();
    Navigator.push(context,
        PageTransition(child: SelectCountry(), type: PageTransitionType.fade));
  }

  Future<void> createUser(BuildContext context) async {
    try {
      valdiation();
      await Database.auth.createUserWithEmailAndPassword(
          email: username!.text, password: password!.text);
      await storeUser();
      if (isChecked == true) {
       await SP.preferences!.setString("email", username!.text);
       await SP.preferences!.setString("password", password!.text);
      }
      Fluttertoast.showToast(
        msg: 'Sign up successful',
        backgroundColor: MyColors.grey,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
      );
      navigateToNextPage(context);
    } on Exception {
      Fluttertoast.showToast(
        msg: 'Error on create your account',
        backgroundColor: MyColors.grey,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  Future<void> storeUser() async {
    String docId = Database.auth.currentUser!.uid;
    await Database.database
        .collection("Users")
        .doc(docId)
        .set({"email": username!.text, "password": password!.text});
  }

  
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      GoogleSignIn googleSignIn = await GoogleSignIn();
      GoogleSignInAccount? googleAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth =
          await googleAccount!.authentication;
      AuthCredential authCredential = await GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      UserCredential user = await Database.auth.signInWithCredential(authCredential);
      if (isChecked == true) {
      await SP.preferences!.setString("email", user.user!.email!);
      }
      await storeGoogleUserInfo();
      navigateToNextPage(context);
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
  Future<void> storeGoogleUserInfo() async {
    User? user = await Database.auth.currentUser;
    String docId = await Database.auth.currentUser!.uid;
    await Database.database.collection("Users").doc(docId).set({
      "username": user!.displayName,
      "email": user.email,
      "phoneNumber": user.phoneNumber,
      "photoURL": user.photoURL
    });
  }

}
