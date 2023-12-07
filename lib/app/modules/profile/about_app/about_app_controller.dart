import 'package:black_market/app/core/model/setting.dart';
import 'package:black_market/app/modules/splash/shared.dart';
import 'package:get/get.dart';

class AboutAppController extends GetxController {
  String text = "";

  @override
  void onInit() {
    getSettingFromPrefs();

    super.onInit();
  }

  Future<void> getSettingFromPrefs() async {
    Setting? storedSetting = await Shared.getSettingFromPrefs();

    if (storedSetting != null) {
      // Use storedSetting as needed

      text = storedSetting.dealingcaution;

      update(["AboutAppController"]);
    } else {
      // Setting is not found in SharedPreferences
    }
  }

  // getTextAboutApp() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? aboutText = prefs.getString('aboutText');
  //   text = aboutText!;
  //   update(["AboutAppController"]);
  // }
}
