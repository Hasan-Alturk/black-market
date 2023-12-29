import 'dart:developer';

import 'package:black_market/app/core/model/bank.dart';
import 'package:black_market/app/core/plugin/shared_storage.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  List<Bank> favouriteBankList = [];
  
  @override
  void onInit() async {
    await getFavouriteBanks();
    super.onInit();
  }

  Future<void> getFavouriteBanks() async {
    List<Bank> favBanks = await SharedStorage.getFavouriteBanks();
    // List<LatestCurrency> currencies = await SharedStorage.getCurrencies();
    if (favBanks.isNotEmpty) {
      log("favBanks : ${favBanks.length.toString()}");
      favouriteBankList.addAll(favBanks);
      update(["favouriteList"]);
      // sortLatestCurrency();
    } else {
      return;
    }
  }

  void goToBankDetails() {
    Get.offNamed("/bank_details");
  }
}
