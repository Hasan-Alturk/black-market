import 'dart:developer';

import 'package:black_market/app/core/model/historical_currency_black_prices.dart';
import 'package:black_market/app/core/model/historical_currency_live_prices.dart';
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

  Future<HistoricalCurrencyLivePrices> getHistoricalCurrenciesLivePrices({
    String? startDate,
    int? currencyId,
    String? type,
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
      HistoricalCurrencyLivePrices historicalCurrencyLivePrices =
          HistoricalCurrencyLivePrices.fromJson(response.data);

      return historicalCurrencyLivePrices;
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

  Future<HistoricalCurrencyBlackPrices> getHistoricalCurrencyBlackPrices({
    String? startDate,
    int? currencyId,
    String? type,
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
      HistoricalCurrencyBlackPrices historicalCurrencyBlackPrices =
          HistoricalCurrencyBlackPrices.fromJson(response.data);

      return historicalCurrencyBlackPrices;
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
