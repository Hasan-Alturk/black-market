import 'dart:developer';

import 'package:black_market/app/core/model/bank.dart';
import 'package:black_market/app/core/model/currency.dart';
import 'package:black_market/app/core/model/currency_in_bank.dart';
import 'package:black_market/app/core/model/latest_currency.dart';
import 'package:black_market/app/core/repo/bank_repo.dart';
import 'package:black_market/app/core/repo/currency_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:get/get.dart';

class BankDetailsController extends GetxController {
  dynamic bankId = Get.arguments;

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
    });
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
      latestCurrencyList.forEach(
        (element) => log(element.name.toString() + element.icon.toString()),
      );
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
            sellPrice: b.sellPrice));
        update(["currenciesInBank", "bankPrices"]);

        // log(b.sellPrice.toString() + " " + b.currencyName);
      }
    }
  }

  void getBankData(int bankId) {
    bankData.clear();
    for (var element in latestCurrencyList) {
      var x = element.bankPrices!.where((value) =>
          DateTime.parse(value.createdAt!).difference(DateTime.now()).abs() >
              Duration.zero &&
          DateTime.parse(value.createdAt!).difference(DateTime.now()).abs() <
              const Duration(hours: 24));
      x.forEach((p) {
        if (p.bankId == bankId) {
          var bank = bankList.where((w) => w.id == bankId);
          bankData.add(CurrencyInBank(
              currencyId: element.id!,
              currencyIcon: element.icon,
              currencyName: element.name,
              currencyCode: element.code!,
              bankId: bankId,
              bankIcon: bank.first.icon!,
              bankName: bank.first.name!,
              sellPrice: p.sellPrice!,
              buyPrice: p.buyPrice!,
              createdAt: p.createdAt!,
              updatedAt: p.updatedAt!));
          log("Eman...${element.name} ${bank.first.name} : ${p.bankId} :${p.sellPrice}  ${p.createdAt.toString()}");
          update(["bankDetails", "bankInfo", "currenciesInBank"]);
        }
      });
    }
  }
}
