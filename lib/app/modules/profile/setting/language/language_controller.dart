import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:get/get.dart';

class LanguagegController extends GetxController {
  RxBool rememberLanguage = false.obs;
  final languages = [
    AppStrings.languageArabic,
    AppStrings.languageEnglish,
  ];

  void goToMainSetting() {
    Get.offNamed("/main_setting");
  }
  //   void goToMainProfile() {
  //   Get.offNamed("/main_profile");
  // }

  ///storage.saveUser(user);
  // Get.to(Home());
}
