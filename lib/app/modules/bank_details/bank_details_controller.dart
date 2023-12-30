import 'package:black_market/app/core/mapper/currency.dart';
import 'package:black_market/app/core/mapper/currency_in_bank.dart';
import 'package:black_market/app/core/model/bank.dart';
import 'package:black_market/app/core/model/latest_currency.dart';
import 'package:black_market/app/core/plugin/shared_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankDetailsController extends GetxController {
  dynamic bankId = Get.arguments[0];
  dynamic selectedCurrencyId = Get.arguments[1];

  var amountController = TextEditingController().obs;
  num totalAmount = 0.0;

  List<Currency> currency = [];
  String? error;
  List<Bank> bankList = [];
  List<LatestCurrency> latestCurrencyList = [];
  List<CurrencyInBank> bankData = [];

  LatestCurrency? egyptCurrency;

  @override
  void onInit() {
    super.onInit();
    getLatestCurrenciesFromPrefs().then((_) async {
      await getBanksFromPrefs();

      await getBankData(bankId);
      await getCurrencyInBank(selectedCurrencyId).then((value) {
        if (currency.isNotEmpty) {
          totalAmount = currency.first.buyPrice;
        }
      });
    });
  }

  Future<void> getBanksFromPrefs() async {
    var banks = await SharedStorage.getSortedBanks();
    if (banks.isNotEmpty) {
      bankList.addAll(banks);
    } else {
      return;
    }
    // update(["bankList"]);
  }

  Future<void> getLatestCurrenciesFromPrefs() async {
    var currencies = await SharedStorage.getCurrenciesSorted();
    if (currencies.isNotEmpty) {
      var v = currencies.where((element) => element.id == 21);
      egyptCurrency = LatestCurrency(
          id: v.first.id,
          banner: v.first.banner,
          icon: v.first.icon,
          name: v.first.name,
          code: v.first.code,
          canBeMain: v.first.canBeMain,
          sort: v.first.sort,
          showNetworkImage: v.first.showNetworkImage,
          lastUpdate: v.first.lastUpdate,
          createdAt: v.first.createdAt,
          updatedAt: v.first.updatedAt,
          livePrices: v.first.livePrices,
          blackMarketPrices: v.first.blackMarketPrices,
          bankPrices: v.first.bankPrices);
      latestCurrencyList.addAll(currencies);
    } else {
      return;
    }
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

  BankDetailsController();

  Future<void> getCurrencyInBank(int currencyId) async {
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
          "totalAmount"
        ]);
      }
    }
  }

  Future<void> getBankData(int bankId) async {
    bankData.clear();
    for (var element in latestCurrencyList) {
      if (element.bankPrices != null) {
        // for (var e in element.bankPrices!) {
        //   print("currencyName: ${element.name} + bankName: ${e.bankId}+ sellPrice :  ${e.sellPrice} + date : ${e.date.toString()}");
        // }

        var x = element.bankPrices!.where((value) {
          return DateTime.parse(value.date).day == DateTime.now().day;
        });
        var bank = bankList.where((w) => w.id == bankId);

        for (var p in x) {
          if (p.bankId == bankId) {
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
                updatedAt: p.updatedAt,
                bankSort: bank.first.sort!,
                lastUpdate: element.lastUpdate.toString(),
                blackMarketBuyPrice: element.blackMarketPrices?.last.buyPrice));
            update(["bankDetails", "bankInfo", "currenciesInBank"]);
          }
        }
      }
    }
  }
}
