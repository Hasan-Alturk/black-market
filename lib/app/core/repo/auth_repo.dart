import 'dart:developer';

import 'package:black_market/app/core/model/user.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:dio/dio.dart';

String baseUrl = "https://voipsys.space/api";

class AuthRepo {
  AuthRepo(this.dio);
  final Dio dio;

  Future<MainUser> login(
      {required String email, required String password}) async {
    try {
      var response = await dio.post(
        "$baseUrl/login",
        data: {
          "email": email,
          "password": password,
        },
      );

      MainUser mainUser = MainUser.fromJson(response.data);
      return mainUser;
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          throw ExceptionHandler("User not found");
        } else if (e.response!.statusCode == 409) {
          throw ExceptionHandler("Wrong password");
        }
      }

      throw ExceptionHandler("Unknown error");
    }
  }

// <User>
  Future register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      Response response = await dio.post(
        "$baseUrl/register",
        data: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": passwordConfirmation,
        },
      );
      log(response.statusCode.toString()); // طباعة رمز الاستجابة
      log(response.headers.toString()); // طباعة رؤوس الاستجابة
      log(response.data.toString());
      //   return User.fromMap(response.data);
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      if (e.response != null) {
        if (e.response!.statusCode == 400) {
          throw ExceptionHandler("المستحدم موجود مسبقاََ");
        }
      }
      throw ExceptionHandler("Unknown error");
    }
  }
}
