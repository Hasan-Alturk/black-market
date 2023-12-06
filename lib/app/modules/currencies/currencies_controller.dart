import 'dart:developer';

import 'package:black_market/app/core/model/bank.dart';
import 'package:black_market/app/core/model/currency_in_bank.dart';
import 'package:black_market/app/core/model/latest_currency.dart';
import 'package:black_market/app/core/repo/bank_repo.dart';
import 'package:black_market/app/core/repo/currency_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrenciesController extends GetxController {
  final BankRepo bankRepo;
  final CurrencyRepo currencyRepo;
  int selectedCurrencyId = 19;
  String name = "";

  String? error;
  List<Bank> bankList = [];
  List<LatestCurrency> latestCurrencyList = [];
  List<CurrencyInBank> currencyInBankList = [];
  List<CurrencyInBank> bankData = [];

  CurrenciesController({required this.currencyRepo, required this.bankRepo});
  void goToBankDetails(int bankId) {
    Get.toNamed("/bank_details", arguments: bankId);
  }

  void goToNotification() {
    Get.toNamed("/notifications");
  }

  @override
  void onInit() {
    super.onInit();
    getName();
    getBanks();
    getLatestCurreny()
        .then((value) => currenyAccordingToBankInfo(selectedCurrencyId));
  }

  Future<void> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name')!;
  }

  void currenyAccordingToBankInfo(int currencyId) {
    currencyInBankList.clear();
    for (var element in latestCurrencyList) {
      for (var bank in element.bankPrices) {
        for (var b in bankList) {
          if (bank.currencyId == currencyId && b.id == bank.bankId) {
            log("elements ${element.name}");
            currencyInBankList.add(CurrencyInBank(
                currencyId: currencyId,
                currencyIcon: element.icon.toString(),
                currencyName: element.name.toString(),
                currencyCode: element.code.toString(),
                bankId: bank.bankId,
                bankIcon: b.icon.toString(),
                bankName: b.name.toString(),
                sellPrice: bank.sellPrice,
                buyPrice: bank.buyPrice,
                lastUpdate: element.lastUpdate,
                blackMarketBuyPrice: element.blackMarketPrices.last.buyPrice,
                createdAt: element.createdAt.toString(),
                updatedAt: element.updatedAt.toString()));
          } else {
            continue;
          }
        }
      }
    }

    for (var element in currencyInBankList) {
      log(element.currencyName.toString() +
          element.sellPrice.toString() +
          element.currencyId.toString());
    }
    log("length${currencyInBankList.length}");
    update(["bankList", "currencies", "currencyList"]);
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
      for (var element in latestCurrencyList) {
        log(element.name.toString() + element.icon.toString());
      }
      update([""]);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      error = e.error;
      log(error!);
    }
  }

  void getBankData(int bankId) {
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
              lastUpdate: element.lastUpdate,
              blackMarketBuyPrice: element.blackMarketPrices.last.buyPrice,
              updatedAt: p.updatedAt));
          log("Eman...${element.name} ${bank.first.name} : ${p.bankId} :${p.sellPrice}  ${p.createdAt.toString()}");
        }
      }
    }
  }
}
