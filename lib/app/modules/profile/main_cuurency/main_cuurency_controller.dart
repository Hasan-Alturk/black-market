import 'package:black_market/app/core/model/latest_currency.dart';
import 'package:black_market/app/core/plugin/shared_storage.dart';
import 'package:get/get.dart';

class MainCurencyController extends GetxController {
  RxBool rememberCurrency = false.obs;

  List<LatestCurrency> latestCurrencyList = [];

  @override
  void onInit() async {
    await getLatestCurrenciesFromPrefs();
    super.onInit();
  }

  Future<void> getLatestCurrenciesFromPrefs() async {
    var currencies = await SharedStorage.getCurrencies();
    if (currencies.isNotEmpty) {
      latestCurrencyList.addAll(currencies);
      update();
    } else {
      return;
    }
  }
}
