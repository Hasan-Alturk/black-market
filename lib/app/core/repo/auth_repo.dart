import 'dart:developer';

import 'package:black_market/app/core/services/error_handler.dart';
import 'package:dio/dio.dart';

String baseUrl = "https://voipsys.space/api";

class AuthRepo {
  AuthRepo(this.dio);
  final Dio dio;
  Future login({required String email, required String password}) async {
    try {
      var response = await dio.post("$baseUrl/login", data: {
        "email": email,
        "password": password,
      });
      //   User user = User.fromMap(response.data);
      //   return user;
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          throw ExceptionHandler("User not found");
        } else if (e.response!.statusCode == 409) {
          throw ExceptionHandler("Wrong password");
        }
      }
    }
    throw ExceptionHandler("Unknown error");
  }

  // Future<User> register({
  //   required String username,
  //   required String password,
  //   required String fullname,
  //   required String city,
  //   required String phone,
  // }) async {
  //   try {
  //     Response response = await dio.post("$baseUrl/user/register", data: {
  //       "full_name": fullname,
  //       "username": username,
  //       "password": password,
  //       "city": city,
  //       "phone": phone,
  //     });
  //     log(response.data.toString());
  //     return User.fromMap(response.data);
  //   } on DioError catch (e) {
  //     log(e.response!.statusCode.toString());
  //     if (e.response != null) {
  //       if (e.response!.statusCode == 400) {
  //         throw ExceptionHandler("User aleady exist");
  //       }
  //     }
  //   }
  //   throw ExceptionHandler("Unknown error");
  // }
}
