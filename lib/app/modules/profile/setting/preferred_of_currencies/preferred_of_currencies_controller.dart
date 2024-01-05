import 'package:black_market/app/core/model/latest_currency.dart';
import 'package:black_market/app/core/plugin/shared_storage.dart';
import 'package:black_market/app/core/repo/setting_repo.dart';
import 'package:black_market/app/modules/main/main_home_controller.dart';
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
    for (int i = 0; i < latestCurrencyList.length; i++) {
      latestCurrencyList[i].sort = i;
    }

    update(["currency"]);
  }

  Future<void> getLatestCurrenciesFromPrefs() async {
    var currencies = await SharedStorage.getCurrenciesSorted();
    if (currencies.isNotEmpty) {
      latestCurrencyList.addAll(currencies);
    } else {
      return;
    }

    update(["currency"]);
  }

  Future<void> saveNewCurrencies(List<LatestCurrency> currencies) async {
    isLoading = true;
    update(["saveNewCurrencies"]);
    await Future.delayed(const Duration(seconds: 1));
    await SharedStorage.saveCurrenciesSorted(currencies);
    isLoading = false;

    update(["saveNewCurrencies"]);

    Get.offAllNamed("/main_home");
    Get.find<MainHomeController>().onInit();

    // isLoading = false;
  }
}
