import 'dart:developer';

import 'package:black_market/app/core/model/favourite.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:dio/dio.dart';

String baseUrl = "https://voipsys.space/api";

class FavouriteRepo {
  final Dio dio;

  FavouriteRepo({required this.dio});

  Future<Favourite> addFavourite(
      {required String bankId,
      required String currencyId,
      required String token}) async {
    try {
      Response response = await dio.post(
        "$baseUrl/favorites/add",
        data: {
          "bank_id": bankId,
          "currency_id": currencyId,
        },
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      Favourite favourite = Favourite.fromJson(response.data);
      log(favourite.createdAt);
      return favourite;
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          throw ExceptionHandler("Favourite not found");
        } else if (e.response!.statusCode == 302) {
          throw ExceptionHandler("It has already been added to favorites");
        }
      }
      throw ExceptionHandler("Unknown error");
    }
  }

  Future<String> removeFavourite(
      {required String bankId,
      required String currencyId,
      required String token}) async {
    try {
      Response response = await dio.post(
        "$baseUrl/favorites/add",
        data: {
          "bank_id": bankId,
          "currency_id": currencyId,
        },
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      String res = response.data.toString();
      log(res);
      return res;
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          throw ExceptionHandler("Favourite not found");
        } else if (e.response!.statusCode == 302) {
          throw ExceptionHandler("It has already been delete from favorites");
        }
      }
      throw ExceptionHandler("Unknown error");
    }
  }
}
