import 'package:black_market/app/core/model/bank.dart';
import 'package:black_market/app/core/plugin/shared_storage.dart';
import 'package:black_market/app/core/repo/setting_repo.dart';
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
    getBanksFromPrefs();
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
     for (int i = 0; i < bankList.length; i++) {
      bankList[i].sort = i;
    }
    update(["bankList"]);
  }

  Future<void> getBanksFromPrefs() async {
    var banks = await SharedStorage.getSortedBanks();
    if (banks.isNotEmpty) {
      bankList.addAll(banks);
    } else {
      return;
    }
    update(["bankList"]);
  }

  Future<void> saveNewBanks(List<Bank> banks) async {
    isLoading = true;
    update(["saveNewBanks"]);
    await Future.delayed(const Duration(seconds: 1));
    await SharedStorage.saveSortedBanks(banks);
    isLoading = false;
    update(["saveNewBanks"]);
  }
}
