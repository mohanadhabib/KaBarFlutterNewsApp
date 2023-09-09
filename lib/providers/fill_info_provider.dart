import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_news_app/services/database_service.dart';
import 'package:flutter_news_app/services/preference_service.dart';
import 'package:flutter_news_app/style/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class FillInfoProvider extends ChangeNotifier {
  TextEditingController? username = TextEditingController();
  TextEditingController? fullname = TextEditingController();
  TextEditingController? email = TextEditingController();
  TextEditingController? phoneNumber = TextEditingController();
  String? imgUrl;
  File? imgFile;
  Future<void> getImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? img = await imagePicker.pickImage(source: ImageSource.gallery);
    imgFile = File(img!.path);
    notifyListeners();
  }

  Future<void> storeInfo() async {
    String id = await Database.auth.currentUser!.uid;
    await Database.storage
        .refFromURL('gs://kabarnewsapp.appspot.com/')
        .child('image${await Database.auth.currentUser!.uid}')
        .putFile(imgFile!);
    imgUrl = await Database.storage
        .refFromURL('gs://kabarnewsapp.appspot.com/')
        .child('image${await Database.auth.currentUser!.uid}')
        .getDownloadURL();
    await Database.database.collection("Users").doc(id).update({
      "username": username!.text,
      "fullname": fullname!.text,
      "email": email!.text,
      "phoneNumber": phoneNumber!.text,
      "imgUrl": imgUrl
    });
    SP.preferences!.setString("username", username!.text);
    SP.preferences!.setString("fullname", fullname!.text);
    SP.preferences!.setString("email", email!.text);
    SP.preferences!.setString("phoneNumber", phoneNumber!.text);
    SP.preferences!.setString("imgUrl", imgUrl!);
    username!.clear();
    fullname!.clear();
    email!.clear();
    phoneNumber!.clear();
    Fluttertoast.showToast(
      msg: 'Info Saved Successfully',
      backgroundColor: MyColors.grey,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
