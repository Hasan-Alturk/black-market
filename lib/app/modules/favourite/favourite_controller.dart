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
    favouriteBankList.clear();
    List<Bank> favBanks = await SharedStorage.getFavouriteBanks();
    if (favBanks.isNotEmpty) {
      log("favBanks : ${favBanks.length.toString()}");
      favouriteBankList.addAll(favBanks);
      update(["favouriteList"]);
    } else {
      return;
    }
  }

  Future<void> deleteFavouriteBanks(Bank bank) async {
    if (favouriteBankList.isNotEmpty) {
      await SharedStorage.deleteFavouriteItem(bank);
      favouriteBankList.removeWhere((element) => element.id == bank.id);
      update(["favouriteList"]);
    } else {
      return;
    }
  }

  void goToBankDetails() {
    Get.offNamed("/bank_details");
  }
}
