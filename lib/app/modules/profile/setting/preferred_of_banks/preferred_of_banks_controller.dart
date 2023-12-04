import 'dart:developer';

import 'package:black_market/app/core/model/bank.dart';
import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:get/get.dart';

class PreferredOfBanksController extends GetxController {
  PreferredOfBanksController({required this.settingRepo});

  final SettingRepo settingRepo;
  List<Bank> bankList = [];
  String? error;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    getBanks();
  }

  void updateMyTiles(int oldIndex, int newIndex) {
    // this adjustment is needed when moving down the list
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    // get the tile we are moving
    final Bank tile = bankList.removeAt(oldIndex);
    // place the tile in the new position
    bankList.insert(newIndex, tile);
    update(["bankList"]);
  }

  Future<void> getBanks() async {
    try {
      error = null;
      update(["bankList"]);
      List<Bank> banks = await settingRepo.getBanks();
      bankList.addAll(banks);
      update(["bankList"]);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      error = e.error;
      log(error!);
    }
  }

  //   void goToMainProfile() {
  //   Get.offNamed("/main_profile");
  // }

  ///storage.saveUser(user);
  // Get.to(Home());
}
