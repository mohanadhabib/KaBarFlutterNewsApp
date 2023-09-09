import 'package:flutter/material.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  String? restoreMethod = 'email';
  String? emailSelected = 'email';
  String? smsSelected = 'sms';
  bool? isPasswordValid = true;
  TextEditingController? emailPhone = TextEditingController();
  TextEditingController? pin0 = TextEditingController();
  TextEditingController? pin1 = TextEditingController();
  TextEditingController? pin2 = TextEditingController();
  TextEditingController? pin3 = TextEditingController();
  String? otpCode;
  Key key = GlobalKey<FormState>();

  void changeSelection(String? value) {
    restoreMethod = value;
    notifyListeners();
  }  

}
