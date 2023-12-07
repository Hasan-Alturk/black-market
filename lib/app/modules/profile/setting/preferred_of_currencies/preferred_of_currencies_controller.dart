import 'dart:developer';

import 'package:black_market/app/core/model/latest_currency.dart';
import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:get/get.dart';

class PreferredOfCurrenciesController extends GetxController {
  PreferredOfCurrenciesController({required this.settingRepo});
  bool isLoading = false;
  final SettingRepo settingRepo;
  List<LatestCurrency> currenciesList = [];

  @override
  void onInit() {
    super.onInit();
    getCurrency();
  }

  void updateMyTiles(int oldIndex, int newIndex) {
    // this adjustment is needed when moving down the list
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    // get the tile we are moving
    final LatestCurrency tile = currenciesList.removeAt(oldIndex);
    // place the tile in the new position
    currenciesList.insert(newIndex, tile);
    update(["currency"]);
  }

  Future<void> getCurrency() async {
    try {
      update(["currency"]);
      List<LatestCurrency> currencies = await settingRepo.getLatestCurrencies();
      currenciesList.addAll(currencies);
      for (var element in currenciesList) {
        log(element.name);
      }
      update(["currency"]);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      log(e.error);
      throw ExceptionHandler("Unknown error");
    }
  }
}
