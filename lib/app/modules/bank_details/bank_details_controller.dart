import 'dart:developer';

import 'package:black_market/app/core/model/bank.dart';
import 'package:black_market/app/core/mapper/currency.dart';
import 'package:black_market/app/core/mapper/currency_in_bank.dart';
import 'package:black_market/app/core/model/latest_currency.dart';
import 'package:black_market/app/core/repo/bank_repo.dart';
import 'package:black_market/app/core/repo/currency_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankDetailsController extends GetxController {
  dynamic bankId = Get.arguments;
  var amountController = TextEditingController().obs;
  num totalAmount = 0.0;
  final BankRepo bankRepo;
  final CurrencyRepo currencyRepo;
  List<Currency> currency = [];
  String? error;
  List<Bank> bankList = [];
  List<LatestCurrency> latestCurrencyList = [];
  List<CurrencyInBank> bankData = [];

  @override
  void onInit() {
    super.onInit();
    getBanks();
    getLatestCurreny().then((_) {
      getBankData(bankId);
      getCurrencyInBank(19);
      totalAmount = currency.first.buyPrice;
    });
  }

  void calculateTotalPrice() {
    if (currency.isNotEmpty) {
      if (amountController.value.text.isNotEmpty) {
        totalAmount =
            num.parse(amountController.value.text) * currency.first.buyPrice;
      } else {
        totalAmount = currency.first.buyPrice;
      }
      update(["totalAmount"]);
    }
  }

  BankDetailsController({required this.bankRepo, required this.currencyRepo});
  Future<void> getBanks() async {
    try {
      error = null;
      List<Bank> banks = await bankRepo.getBanks();
      bankList.addAll(banks);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      error = e.error;
      log(error!);
    }
  }

  Future<void> getLatestCurreny() async {
    try {
      error = null;
      List<LatestCurrency> latestCurrencies =
          await currencyRepo.getLatestCurrencies();
      latestCurrencyList.addAll(latestCurrencies);
      for (var element in latestCurrencyList) {
        log(element.name.toString() + element.icon.toString());
      }
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      error = e.error;
      log(error!);
    }
  }

  void getCurrencyInBank(int currencyId) {
    currency.clear();
    for (var b in bankData) {
      if (b.currencyId == currencyId) {
        currency.add(Currency(
            currencyId: currencyId,
            currencyIcon: b.currencyIcon,
            buyPrice: b.buyPrice,
            currencyName: b.currencyName,
            sellPrice: b.sellPrice,
            currencyCode: b.currencyCode,
            blackMarketBuyPrice: b.blackMarketBuyPrice,
            lastUpdate: DateTime.now()
                .difference(DateTime.parse(b.lastUpdate))
                .inMinutes));
        calculateTotalPrice();
        update([
          "currenciesInBank",
          "bankPrices",
          "bankInfo",
          "calculatorView",
        ]);
      }
    }
  }

  void getBankData(int bankId) {
    bankData.clear();
    for (var element in latestCurrencyList) {
      var x = element.bankPrices.where((value) =>
          DateTime.parse(value.createdAt).difference(DateTime.now()).abs() >
              Duration.zero &&
          DateTime.parse(value.createdAt).difference(DateTime.now()).abs() <
              const Duration(hours: 24));
      for (var p in x) {
        if (p.bankId == bankId) {
          var bank = bankList.where((w) => w.id == bankId);
          bankData.add(CurrencyInBank(
              currencyId: element.id,
              currencyIcon: element.icon,
              currencyName: element.name,
              currencyCode: element.code,
              bankId: bankId,
              bankIcon: bank.first.icon!,
              bankName: bank.first.name!,
              sellPrice: p.sellPrice,
              buyPrice: p.buyPrice,
              createdAt: p.createdAt,
              updatedAt: p.updatedAt,
              lastUpdate: element.lastUpdate,
              blackMarketBuyPrice: element.blackMarketPrices.last.buyPrice));
          update(["bankDetails", "bankInfo", "currenciesInBank"]);
        }
      }
    }
  }
}
