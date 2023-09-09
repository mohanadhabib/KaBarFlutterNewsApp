import 'package:shared_preferences/shared_preferences.dart';

class SP{
  static SharedPreferences? preferences;
  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance().whenComplete(() => print("----- preference initilized -----"));
  }
}