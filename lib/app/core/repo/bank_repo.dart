import 'dart:developer';

import 'package:black_market/app/core/model/bank.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:dio/dio.dart';

String baseUrl = "https://voipsys.space/api";

class BankRepo {
  BankRepo(this.dio);
  final Dio dio;

  Future<List<Bank>> getBanks() async {
    try {
      var response = await dio.get("$baseUrl/banks");
      log(response.data.toString());

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
}
