import 'dart:developer';

import 'package:black_market/app/core/model/gold.dart';
import 'package:black_market/app/core/model/gold_company.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:dio/dio.dart';

String baseUrl = "https://voipsys.space/api";

class GoldRepo {
  GoldRepo(this.dio);
  final Dio dio;

  Future<List<GoldCompany>> getGoldCompanies() async {
    try {
      var response = await dio.get("$baseUrl/companies");
      log(response.data.toString());

      List<GoldCompany> goldCompany =
          GoldCompany.goldCompanyList(response.data);

      return goldCompany;
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          throw ExceptionHandler("Gold Company not found");
        }
      }

      throw ExceptionHandler("Unknown error");
    }
  }

  Future<List<Gold>> getGold() async {
    try {
      var response = await dio.get("$baseUrl/gold");
      // log(response.data.toString());

      List<Gold> gold = Gold.goldList(response.data);

      return gold;
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          throw ExceptionHandler("Gold not found");
        }
      }

      throw ExceptionHandler("Unknown error");
    }
  }
}
