import 'dart:developer';

import 'package:black_market/app/core/model/historical_currency.dart';
import 'package:black_market/app/core/model/latest_currency.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:dio/dio.dart';

String baseUrl = "https://voipsys.space/api";

class CurrencyRepo {
  CurrencyRepo(this.dio);
  final Dio dio;

  Future<List<LatestCurrency>> getLatestCurrencies() async {
    try {
      Response response = await dio.get("$baseUrl/currencies/latest");

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

  Future<HistoricalCurrency> getHistoricalCurrencies({
    required String startDate,
    required int currencyId,
    required String type,
  }) async {
    try {
      Map<String, dynamic> queryParameters = {
        'start_date': startDate,
        "currency_id": currencyId,
        "type": type,
      };
      Response response = await dio.get(
        "$baseUrl/currencies/historical",
        queryParameters: queryParameters,
      );
      HistoricalCurrency historicalCurrency =
          HistoricalCurrency.fromJson(response.data);
      log("response ${historicalCurrency.blackMarketPrices}");

      return historicalCurrency;
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
