import 'package:black_market/app/core/model/setting.dart';
import 'package:black_market/app/core/plugin/shared_storage.dart';
import 'package:get/get.dart';

class AboutAppController extends GetxController {
  String text = "";

  @override
  void onInit() {
    getSettingFromPrefs();

    super.onInit();
  }

  Future<void> getSettingFromPrefs() async {
    Setting? storedSetting = await SharedStorage.getSettingFromPrefs();

    if (storedSetting != null) {
      text = storedSetting.dealingcaution;

      update(["AboutAppController"]);
    } else {}
  }

 
}
