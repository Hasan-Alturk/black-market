import 'dart:developer';

import 'package:black_market/app/core/mapper/currency_in_bank.dart';
import 'package:black_market/app/core/mapper/currency_in_home.dart';
import 'package:black_market/app/core/model/bank.dart';
import 'package:black_market/app/core/model/historical_currency_black_prices.dart';
import 'package:black_market/app/core/model/historical_currency_live_prices.dart';
import 'package:black_market/app/core/model/latest_currency.dart';
import 'package:black_market/app/core/model/user_setting.dart';
import 'package:black_market/app/core/plugin/shared_storage.dart';
import 'package:black_market/app/core/repo/currency_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CurrenciesController extends GetxController {
  CurrenciesController({required this.currencyRepo});

  final CurrencyRepo currencyRepo;

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

  Map<String, List<LivePrices>> livePricesMap = {};
  Map<String, List<BlackPrices>> blackPricesMap = {};
  List<List<String>> result = [];

  Future<Map<String, List<LivePrices>>>
      getHistoricalCurrencyLivePrices() async {
    try {
      HistoricalCurrencyLivePrices currencyList =
          await currencyRepo.getHistoricalCurrenciesLivePrices(
        startDate: '2023-09-06',
        currencyId: selectedCurrencyId,
        type: "live",
      );

      livePricesMap = currencyList.livePrices;

      // livePricesMap.forEach(
      //   (currency, livePricesList) {
      //     log('العملة: $currency');

      //     // الدوران عبر قائمة كائنات LivePrices
      //     for (var livePrice in livePricesList) {
      //       String x = livePrice.price.toString();
      //       String y = livePrice.date;

      //       log('معرف العملة: ${livePrice.currencyId}');
      //       log('السعر: ${livePrice.price}');
      //       log('التاريخ: ${livePrice.date}');
      //       log('--------------');
      //     }
      //   },
      // );
      return livePricesMap;
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      throw ExceptionHandler("Unknown error");
    }
  }

  Future<void> getHistoricalCurrencyBlackPrices() async {
    try {
      HistoricalCurrencyBlackPrices currencyList =
          await currencyRepo.getHistoricalCurrencyBlackPrices(
        startDate: '2023-09-06',
        currencyId: 15,
        type: "black",
      );
      blackPricesMap = currencyList.blackPrices;
      blackPricesMap.forEach((currency, blackPrices) {
        log('العملة: $currency');

        // الدوران عبر قائمة كائنات LivePrices
        for (var e in blackPrices) {
          log('معرف العملة: ${e.currencyId}');
          log('السعر: ${e.buyPrice}');
          log('السعر: ${e.sellPrice}');
          log('التاريخ: ${e.date}');
          log('--------------');
        }
      });
    } on ExceptionHandler catch (e) {
      log("Error: $e");
    }
  }

  void goToBankDetails(int bankId) {
    Get.toNamed("/bank_details", arguments: [bankId, selectedCurrencyId]);
  }

  void goToNotification() {
    Get.toNamed("/notifications");
  }

  @override
  void onInit() {
    getHistoricalCurrencyLivePrices().then(
      (value) => getData(),
    );
    //   getHistoricalCurrencyBlackPrices();
    getBanksFromPrefs();
    getLatestCurrenciesFromPrefs().then((value) {
      if (latestCurrencyList.isNotEmpty) {
        selectedCurrencyId = latestCurrencyList[0].id!;
        getBanksAccordingToSelectedCurrency(latestCurrencyList[0].id!);
        getCurrencyInBank(latestCurrencyList[0].id!);
        // update();
      }
    });
    getNameAndAvatar();
    super.onInit();
  }

  List<List<String>> getData() {
    livePricesMap.forEach(
      (currency, livePricesList) {
        // log('العملة: $currency');

        // الدوران عبر قائمة كائنات LivePrices
        for (var livePrice in livePricesList) {
          String x = livePrice.price.toString();
          String y = livePrice.date;
          DateTime date = DateFormat('yyyy-MM-dd').parse(y);

          // تحويل التاريخ إلى double باستخدام الأيام كقيمة
          double doubleValue =
              date.difference(DateTime(1970, 1, 1)).inDays.toDouble();

          result.add([x, doubleValue.toString()]);

          log('معرف السعر:$x');
          log('معرف التاريخ:$y');
          log(':$doubleValue');

          // log(': ${livePrice.price}');
          // log('التاريخ: ${livePrice.date}');
          // log('--------------');
        }
      },
    );

    return result;
  }

  Future<void> getBanksFromPrefs() async {
    bankList.clear();
    var banks = await SharedStorage.getSortedBanks();
    if (banks.isNotEmpty) {
      bankList.clear();
      bankList.addAll(banks);
    } else {
      return;
    }
  }

  Future<void> getLatestCurrenciesFromPrefs() async {
    latestCurrencyList.clear();
    var currencies = await SharedStorage.getCurrenciesSorted();
    if (currencies.isNotEmpty) {
      latestCurrencyList.clear();
      currencies.removeWhere((element) => element.id == 21);
      latestCurrencyList.addAll(currencies);
    } else {
      return;
    }
    log("message");
    update();
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

  void getBanksAccordingToSelectedCurrency(int currencyId) {
    currencyInBankList.clear();
    for (var element in latestCurrencyList) {
      if (element.bankPrices != null) {
        var x = element.bankPrices!.where((value) =>
            DateTime.parse(value.updatedAt).day == DateTime.now().day);
        for (var bank in x) {
          innerLoop:
          for (var b in bankList) {
            if (bank.currencyId == currencyId && b.id == bank.bankId) {
              var c = CurrencyInBank(
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
                  bankSort: b.sort!,
                  blackMarketBuyPrice: element.blackMarketPrices?.last.buyPrice,
                  createdAt: element.createdAt.toString(),
                  updatedAt: element.updatedAt.toString());
              if (!(currencyInBankList.contains(c))) {
                currencyInBankList.add(c);
              } else {
                continue;
              }
              break innerLoop;
            } else {
              continue;
            }
          }
        }
      }
    }
    for (var element in currencyInBankList) {
      log(element.bankName);
    }
    sortBanks();
    update(["bankList", "currencies", "currencyList"]);
  }

  void sortBanks() {
    currencyInBankList.sort((a, b) => a.bankSort.compareTo(b.bankSort));
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
            blackMarketBuyPrice: b.blackMarketPrices?.last.buyPrice,
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
        if (e.bankPrices != null) {
          if (e.bankPrices!.isNotEmpty) {
            avgBuyPrice = e.bankPrices!.fold(
                0.0,
                (previousValue, element) =>
                    previousValue + element.buyPrice / e.bankPrices!.length);
            avgSellPrice = e.bankPrices!.fold(
                0.0,
                (previousValue, element) =>
                    previousValue + element.sellPrice / e.bankPrices!.length);
          }
        }

        update(["averageContainer"]);
        // log("Average = ${avgBuyPrice / e.bankPrices!.length}");
      }
    }
  }

  // void getBankData(int bankId) {
  //   for (var element in latestCurrencyList) {
  //     var x = element.bankPrices!.where((value) =>
  //         DateTime.parse(value.createdAt).difference(DateTime.now()).abs() >
  //             Duration.zero &&
  //         DateTime.parse(value.createdAt).difference(DateTime.now()).abs() <
  //             const Duration(hours: 24));
  //     for (var p in x) {
  //       if (p.bankId == bankId) {
  //         var bank = bankList.where((w) => w.id == bankId);
  //         bankData.add(CurrencyInBank(
  //             currencyId: element.id!.toInt(),
  //             currencyIcon: element.icon.toString(),
  //             currencyName: element.name.toString(),
  //             currencyCode: element.code.toString(),
  //             bankId: bankId,
  //             bankIcon: bank.first.icon!,
  //             bankName: bank.first.name!,
  //             sellPrice: p.sellPrice,
  //             buyPrice: p.buyPrice,
  //             createdAt: p.createdAt,
  //             lastUpdate: element.lastUpdate.toString(),
  //             blackMarketBuyPrice: element.blackMarketPrices!.last.buyPrice,
  //             updatedAt: p.updatedAt));
  //       }
  //     }
  //   }
  // }
}
