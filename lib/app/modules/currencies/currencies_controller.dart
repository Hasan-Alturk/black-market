import 'dart:developer';

import 'package:black_market/app/core/mapper/currency_in_bank.dart';
import 'package:black_market/app/core/mapper/currency_in_home.dart';
import 'package:black_market/app/core/model/bank.dart';
import 'package:black_market/app/core/model/latest_currency.dart';
import 'package:black_market/app/core/model/user_setting.dart';
import 'package:black_market/app/core/plugin/shared_storage.dart';
import 'package:get/get.dart';

class CurrenciesController extends GetxController {
  int selectedCurrencyId = 19;
  String name = "";
  String avatar = "";
  List<CurrencyInHome> currency = [];
  num avgBuyPrice = 0;
  num avgSellPrice = 0;

  String? error;
  List<Bank> bankList = [];
  List<LatestCurrency> latestCurrencyList = [];
  List<CurrencyInBank> currencyInBankList = [];
  List<CurrencyInBank> bankData = [];

  void goToBankDetails(int bankId) {
    Get.toNamed("/bank_details", arguments: [bankId, selectedCurrencyId]);
  }

  void goToNotification() {
    Get.toNamed("/notifications");
  }

  @override
  void onInit() {
    getBanksFromPrefs();
    getLatestCurrenciesFromPrefs().then((value) {
      currenyAccordingToBankInfo(selectedCurrencyId);
      getCurrencyInBank(selectedCurrencyId);
    });
    getNameAndAvatar();
    super.onInit();
  }

  Future<void> getBanksFromPrefs() async {
    var banks = await SharedStorage.getBanks();
    if (banks.isNotEmpty) {
      bankList.addAll(banks);
    } else {
      return;
    }
    update(["bankList"]);
  }

  Future<void> getLatestCurrenciesFromPrefs() async {
    var currencies = await SharedStorage.getCurrencies();
    if (currencies.isNotEmpty) {
      latestCurrencyList.addAll(currencies);
    } else {
      return;
    }
  }

  Future<void> getNameAndAvatar() async {
    UserSetting? storedUserSetting =
        await SharedStorage.getUserSettingFromPrefs();
    if (storedUserSetting != null) {
      name = storedUserSetting.name;
      avatar = storedUserSetting.avatar;
    } else {
      return;
    }
    update(["name_and_avatar"]);
  }

  void currenyAccordingToBankInfo(int currencyId) {
    currencyInBankList.clear();
    for (var element in latestCurrencyList) {
      if (element.bankPrices != null) {
        for (var bank in element.bankPrices!) {
          for (var b in bankList) {
            if (bank.currencyId == currencyId && b.id == bank.bankId) {
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
                  lastUpdate: element.lastUpdate.toString(),
                  blackMarketBuyPrice: element.blackMarketPrices!.last.buyPrice,
                  createdAt: element.createdAt.toString(),
                  updatedAt: element.updatedAt.toString()));
            } else {
              continue;
            }
          }
        }
      }
    }
    update(["bankList", "currencies", "currencyList"]);
  }

  void getCurrencyInBank(int currencyId) {
    currency.clear();
    for (var b in latestCurrencyList) {
      if (b.id == currencyId) {
        currency.add(CurrencyInHome(
            currencyId: currencyId,
            currencyName: b.name.toString(),
            currencyIcon: b.icon.toString(),
            currencyCode: b.code.toString(),
            livePrice: b.livePrices!.last.price,
            blackMarketBuyPrice: b.blackMarketPrices!.last.buyPrice,
            lastUpdate: DateTime.now()
                .difference(DateTime.parse(b.lastUpdate!))
                .inMinutes));
      }
      getAverage(currencyId);
    }
    update(["currenciesInBank", "lastUpdateContainer"]);
  }

  void getAverage(int currencyId) {
    for (var e in latestCurrencyList) {
      if (e.id == currencyId) {
        avgBuyPrice = e.bankPrices!.fold(
            0.0,
            (previousValue, element) =>
                previousValue + element.buyPrice / e.bankPrices!.length);
        avgSellPrice = e.bankPrices!.fold(
            0.0,
            (previousValue, element) =>
                previousValue + element.sellPrice / e.bankPrices!.length);
        update(["averageContainer"]);
        log("Average = ${avgBuyPrice / e.bankPrices!.length}");
      }
    }
  }

  void getBankData(int bankId) {
    for (var element in latestCurrencyList) {
      var x = element.bankPrices!.where((value) =>
          DateTime.parse(value.createdAt).difference(DateTime.now()).abs() >
              Duration.zero &&
          DateTime.parse(value.createdAt).difference(DateTime.now()).abs() <
              const Duration(hours: 24));
      for (var p in x) {
        if (p.bankId == bankId) {
          var bank = bankList.where((w) => w.id == bankId);
          bankData.add(CurrencyInBank(
              currencyId: element.id!.toInt(),
              currencyIcon: element.icon.toString(),
              currencyName: element.name.toString(),
              currencyCode: element.code.toString(),
              bankId: bankId,
              bankIcon: bank.first.icon!,
              bankName: bank.first.name!,
              sellPrice: p.sellPrice,
              buyPrice: p.buyPrice,
              createdAt: p.createdAt,
              lastUpdate: element.lastUpdate.toString(),
              blackMarketBuyPrice: element.blackMarketPrices!.last.buyPrice,
              updatedAt: p.updatedAt));
        }
      }
    }
  }
}
