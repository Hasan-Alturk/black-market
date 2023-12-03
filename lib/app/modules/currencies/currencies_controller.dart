import 'dart:developer';

import 'package:black_market/app/core/model/bank.dart';
import 'package:black_market/app/core/model/latest_currency.dart';
import 'package:black_market/app/core/repo/bank_repo.dart';
import 'package:black_market/app/core/repo/currency_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:get/get.dart';

class CurrenciesController extends GetxController {
  final BankRepo bankRepo;
  final CurrencyRepo currencyRepo;

  String? error;
  List<Bank> bankList = [];
  List<LatestCurrency> latestCurrencyList = [];

  CurrenciesController({required this.currencyRepo, required this.bankRepo});
  void goToBankDetails() {
    Get.offNamed("/bank_details");
  }

  void goToNotification() {
    Get.offNamed("/notifications");
  }

  @override
  void onInit() {
    super.onInit();
    getBanks();
    getLatestCurreny();
  }

  Future<void> getBanks() async {
    try {
      error = null;
      update(["bankList"]);
      List<Bank> banks = await bankRepo.getBanks();
      bankList.addAll(banks);
      update(["bankList"]);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      error = e.error;
      log(error!);
    }
  }

  Future<void> getLatestCurreny() async {
    try {
      error = null;
      update([""]);
      List<LatestCurrency> latestCurrencies =
          await currencyRepo.getLatestCurrencies();
      latestCurrencyList.addAll(latestCurrencies);
      update([""]);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      error = e.error;
      log(error!);
    }
  }
}
