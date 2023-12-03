import 'dart:developer';

import 'package:black_market/app/core/model/latest_currency.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:dio/dio.dart';

String baseUrl = "https://voipsys.space/api";

class CurrencyRepo {
  CurrencyRepo(this.dio);
  final Dio dio;

  Future<List<LatestCurrency>> getLatestCurrencies() async {
    try {
      var response = await dio.get("$baseUrl/currencies/latest");
      log("Currency${response.data.toString()}");

      List<LatestCurrency> latestCurrencyList =
          LatestCurrency.latestCurrencyList(response.data);

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
}
