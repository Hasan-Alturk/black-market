import 'dart:developer';

import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:black_market/app/core/model/bank.dart';
import 'package:black_market/app/core/model/latest_currency.dart';
import 'package:black_market/app/core/model/setting.dart';
import 'package:black_market/app/core/model/user_setting.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:dio/dio.dart';


class SettingRepo {
  SettingRepo(this.dio);
  final Dio dio;

  Future<void> logOut({required String token}) async {
    try {
      log("logOut repo:");

      Response res = await dio.get(
        "${BaseUrls.baseUrl}/logout",
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
        "${BaseUrls.baseUrl}/me",
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

  Future<List<Bank>> getBanks() async {
    try {
      Response response = await dio.get("${BaseUrls.baseUrl}/banks");

      List<Bank> bankList = Bank.bankList(response.data);

      return bankList;
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          throw ExceptionHandler("Bank not found");
        }
      }

      throw ExceptionHandler("Unknown error");
    }
  }

  Future<List<LatestCurrency>> getLatestCurrencies() async {
    try {
      Response response = await dio.get("${BaseUrls.baseUrl}/currencies/latest");

      List<LatestCurrency> latestCurrencyList =
          LatestCurrency.latestCurrencyList(response.data);
      // log(latestCurrencyList.length as String);

      return latestCurrencyList;
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          throw ExceptionHandler("Currency List not found");
        }
      }

      throw ExceptionHandler("Unknown error");
    }
  }

  Future<Setting> getSetting() async {
    try {
      Response response = await dio.get(
        "${BaseUrls.baseUrl}/settings/banners.home_global_banner,banners.home_global_yellow_banner,banners.banks_global_banner,banners.banks_global_yellow_banner,banners.above_banks_card,banners.above_banks_card_yellow,app.enable_rate_dialog,app.about_text,app.dealing_caution,ads.display_views_counter,app.min_android_version",
      );

      Setting setting = Setting.fromJson(response.data);

      return setting;
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          throw ExceptionHandler("Setting not found");
        }
      }

      throw ExceptionHandler("Unknown error");
    }
  }
}
