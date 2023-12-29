import 'dart:developer';

import 'package:black_market/app/core/mapper/currency_in_bank.dart';
import 'package:black_market/app/core/mapper/currency_in_home.dart';
import 'package:black_market/app/core/model/bank.dart';
import 'package:black_market/app/core/model/historical_currency_black_prices.dart';
import 'package:black_market/app/core/model/historical_currency_live_prices.dart';
import 'package:black_market/app/core/model/latest_currency.dart';
import 'package:black_market/app/core/model/user_setting.dart';
import 'package:black_market/app/core/plugin/shared_storage.dart';
import 'package:black_market/app/core/repo/bank_repo.dart';
import 'package:black_market/app/core/repo/currency_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:get/get.dart';

class CurrenciesController extends GetxController {
  CurrenciesController({required this.currencyRepo, required this.bankRepo});
  final CurrencyRepo currencyRepo;
  final BankRepo bankRepo;

  bool isLoading = false;
  String? error;
  int selectedCurrencyId = 19;
  String name = "";
  String avatar = "";
  num avgBuyPrice = 0;
  num avgSellPrice = 0;
  List<CurrencyInHome> currency = [];
  List<Bank> bankList = [];
  List<LatestCurrency> latestCurrencyList = [];
  List<CurrencyInBank> currencyInBankList = [];
  List<CurrencyInBank> bankData = [];

  Map<String, List<LivePrices>> livePricesMap = {};
  Map<String, List<BlackPrices>> blackPricesMap = {};

 
  String textChart = "";
  int valueTapBar = 0;

  @override
  void onInit() async {
    await getNameAndAvatar();
    await getBanksFromPrefs();
    await getLatestCurrenciesFromPrefs().then((value) async {
      if (latestCurrencyList.isNotEmpty) {
        selectedCurrencyId = latestCurrencyList[0].id!;
        await getBanksAccordingToSelectedCurrency(latestCurrencyList[0].id!);
        getCurrencyInBank(latestCurrencyList[0].id!);
      }
    });
    super.onInit();
  }

  Future<Map<String, List<LivePrices>>> getHistoricalCurrencyLivePrices(
      String date) async {
    try {
      HistoricalCurrencyLivePrices currencyList =
          await currencyRepo.getHistoricalCurrenciesLivePrices(
        startDate: date,
        currencyId: selectedCurrencyId,
        type: "live",
      );

      livePricesMap = currencyList.livePrices;

      update(["chart"]);

      return livePricesMap;
    } on ExceptionHandler catch (e) {
      isLoading = false;
      update(["chart"]);
      log("Error: $e");
      throw ExceptionHandler("Unknown error");
    }
  }

  Future<Map<String, List<BlackPrices>>> getHistoricalCurrencyBlackPrices(
      String date) async {
    try {
      HistoricalCurrencyBlackPrices currencyList =
          await currencyRepo.getHistoricalCurrencyBlackPrices(
        startDate: date,
        currencyId: selectedCurrencyId,
        type: "black",
      );
      blackPricesMap = currencyList.blackPrices;

      update(["chart"]);
      update(["text_chart"]);

      return blackPricesMap;
    } on ExceptionHandler catch (e) {
      isLoading = false;
      update(["chart"]);
      log("Error: $e");
      throw ExceptionHandler("Unknown error");
    }
  }

  void goToBankDetails(int bankId) {
    Get.toNamed("/bank_details", arguments: [bankId, selectedCurrencyId]);
  }

  void goToNotification() {
    Get.toNamed("/notifications");
  }

  Future<void> getBanksFromPrefs() async {
    bankList.clear();
    var banks = await SharedStorage.getSortedBanks();
    // List<Bank> banks = await SharedStorage.getBanks();
    if (banks.isNotEmpty) {
      bankList.clear();
      bankList.addAll(banks);
    } else {
      return;
    }
    update();
  }

  Future<void> getLatestCurrenciesFromPrefs() async {
    latestCurrencyList.clear();
    List<LatestCurrency> currencies = await SharedStorage.getCurrenciesSorted();
    // List<LatestCurrency> currencies = await SharedStorage.getCurrencies();
    if (currencies.isNotEmpty) {
      currencies.removeWhere((element) => element.id == 21);
      latestCurrencyList.addAll(currencies);
      sortLatestCurrency();
    } else {
      return;
    }
  }

  void sortLatestCurrency() {
    latestCurrencyList.sort((a, b) => a.sort!.compareTo(b.sort!));
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

  Future<String> getTextChart(String t) async {
    textChart = t;
    update(["text_chart"]);
    return textChart;
  }

  Future<void> getBanksAccordingToSelectedCurrency(int currencyId) async {
    currencyInBankList.clear();
    textChart = "";
    for (var element in latestCurrencyList) {
      if (element.bankPrices != null) {
        var x = element.bankPrices!.where((value) {
          // log(value.date);
          return DateTime.parse(value.updatedAt).day == DateTime.now().day;
        });
        for (var bank in x) {
          innerLoop:
          for (var b in bankList) {
            // log(b.name.toString());

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
    // for (var element in currencyInBankList) {
    //   log(element.bankName);
    // }
    sortBanks();
    update(["bankList", "currencies", "currencyList", "text_chart"]);
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

  Future<void> getBanks() async {
    try {
      List<Bank> banks = await bankRepo.getBanks();
      await SharedStorage.saveBanks(banks);
      // update();
    } on ExceptionHandler catch (e) {
      log("Error: $e");
    }
  }

  Future<void> getLatestCurrency() async {
    try {
      List<LatestCurrency> latestCurrencies =
          await currencyRepo.getLatestCurrencies();
      await SharedStorage.saveCurrencies(latestCurrencies);
      // update();
    } on ExceptionHandler catch (e) {
      log("Error: $e");
    }
  }
}
