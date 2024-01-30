import 'dart:developer';

import 'package:black_market/app/core/model/user.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:dio/dio.dart';

import '../constants/base_urls.dart';


class AuthRepo {
  AuthRepo(this.dio);
  final Dio dio;

  Future<MainUser> login(
      {required String email, required String password}) async {
    try {
      Response response = await dio.post(
        "${BaseUrls.baseUrl}/login",
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

  Future<MainUser> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      Response response = await dio.post(
        "${BaseUrls.baseUrl}/register",
        data: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": passwordConfirmation,
        },
      );

      MainUser mainUser = MainUser.fromJson(response.data);
      log(mainUser.accessToken.toString());
      return mainUser;
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

  Future<void> sendOtp({required String email}) async {
    try {
      Response response = await dio.post(
        "${BaseUrls.baseUrl}/forget_password",
        data: {
          "email": email,
        },
      );
      log(response.data);
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

  Future<MainUser> passwordSuccessfully({
    required String password,
    required String passwordConfirmation,
    required String otp,
    required String email,
  }) async {
    try {
      var response = await dio.post(
        "${BaseUrls.baseUrl}/update_forgotten_password",
        data: {
          "password": password,
          "password_confirmation": passwordConfirmation,
          "otp": otp,
          "email": email,
        },
      );
      MainUser mainUser = MainUser.fromJson(response.data);
      log(mainUser.accessToken.toString());
      return mainUser;
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
