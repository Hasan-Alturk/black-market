import 'dart:convert';

import 'package:black_market/app/core/model/setting.dart';
import 'package:black_market/app/core/model/user_setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedStorage {
  static Future<void> saveUserSetting(UserSetting userSetting) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_setting', userSetting.toJson().toString());
  }

// استرجاع UserSetting من SharedPreferences
  static Future<UserSetting?> getUserSettingFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userSettingJson = prefs.getString('user_setting');

    if (userSettingJson!.isNotEmpty) {
      Map<String, dynamic> userSettingMap = json.decode(userSettingJson);
      return UserSetting.fromJson(userSettingMap);
    }

    return null;
  }

  // Save Setting in SharedPreferences
  static Future<void> saveSetting(Setting setting) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("setting", jsonEncode(setting.toJson()));
  }

  // Retrieve Setting from SharedPreferences
  static Future<Setting?> getSettingFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? settingJson = prefs.getString("setting");

    if (settingJson != null && settingJson.isNotEmpty) {
      Map<String, dynamic> settingMap = json.decode(settingJson);
      return Setting.fromJson(settingMap);
    }

    return null;
  }
}
