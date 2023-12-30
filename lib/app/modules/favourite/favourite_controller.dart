import 'dart:developer';

import 'package:black_market/app/core/mapper/currency_in_bank.dart';
import 'package:black_market/app/core/plugin/shared_storage.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  List<CurrencyInBank> favouriteBankList = [];
  int selectedCurrencyId = 19;

  @override
  void onInit() async {
    await getFavouriteBanks();
    super.onInit();
  }

  Future<void> getFavouriteBanks() async {
    favouriteBankList.clear();
    List<CurrencyInBank> favBanks = await SharedStorage.getFavouriteBanks();
    if (favBanks.isNotEmpty) {
      selectedCurrencyId = favBanks.first.currencyId;
      log("favBanks : ${favBanks.length.toString()}");
      favouriteBankList.addAll(favBanks);
      update(["favouriteList"]);
    } else {
      return;
    }
  }

  Future<void> deleteFavouriteBanks(CurrencyInBank bank) async {
    if (favouriteBankList.isNotEmpty) {
      await SharedStorage.deleteFavouriteItem(bank);
      favouriteBankList.removeWhere((element) => element.bankId == bank.bankId);
      update(["favouriteList"]);
    } else {
      return;
    }
  }

  void goToBankDetails(int bankId) {
    Get.toNamed("/bank_details", arguments: [bankId, selectedCurrencyId]);
  }
}
