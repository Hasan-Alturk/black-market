import 'dart:developer';

import 'package:black_market/app/core/model/latest_currency.dart';
import 'package:black_market/app/core/plugin/shared_storage.dart';
import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:get/get.dart';

class PreferredOfCurrenciesController extends GetxController {
  PreferredOfCurrenciesController({required this.settingRepo});
  bool isLoading = false;
  final SettingRepo settingRepo;
  List<LatestCurrency> latestCurrencyList = [];

  @override
  void onInit() async {
    super.onInit();
    await getLatestCurrenciesFromPrefs();
  }

  void updateMyTiles(int oldIndex, int newIndex) {
    // this adjustment is needed when moving down the list
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    // get the tile we are moving
    final LatestCurrency tile = latestCurrencyList.removeAt(oldIndex);
    // place the tile in the new position
    latestCurrencyList.insert(newIndex, tile);
    for (var element in latestCurrencyList) {
      element.sort = newIndex;
    }

    for (var element in latestCurrencyList) {
      log("${element.sort}updateMyTiles");
    }
    log("${latestCurrencyList.length}updateMyTiles");
    update(["currency"]);
  }

  Future<void> getLatestCurrenciesFromPrefs() async {
    var currencies = await SharedStorage.getCurrencies();
    if (currencies.isNotEmpty) {
      latestCurrencyList.addAll(currencies);
    } else {
      return;
    }
    for (var element in latestCurrencyList) {
      log("${element.sort}Prefs");
    }
    log("${latestCurrencyList.length}Prefs");

    update(["currency"]);
  }

  Future<void> saveNewCurrencies(List<LatestCurrency> currencies) async {
    isLoading = true;
    update(["saveNewCurrencies"]);
    await Future.delayed(const Duration(seconds: 1));
    await SharedStorage.saveCurrencies(currencies);
    isLoading = false;

    update(["saveNewCurrencies"]);
    // isLoading = false;
  }
}
