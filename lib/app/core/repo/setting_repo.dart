import 'dart:developer';

import 'package:black_market/app/core/model/user_setting.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:dio/dio.dart';

String baseUrl = "https://voipsys.space/api";

class SettingRepo {
  SettingRepo(this.dio);
  final Dio dio;

  Future<void> logOut({required String token}) async {
    try {
      log("logOut repo:");

      Response res = await dio.get(
        "$baseUrl/logout",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      log("Response Data: ${res.data}");
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          throw ExceptionHandler("");
        }
      }
      throw ExceptionHandler("Unknown error");
    }
  }

  Future<UserSetting> getUserSetting({required String token}) async {
    try {
      Response response = await dio.get(
        "$baseUrl/me",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      UserSetting userSetting = UserSetting.fromJson(response.data);
      return userSetting;
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          throw ExceptionHandler("");
        }
      }
      throw ExceptionHandler("Unknown error");
    }
  }
}