import 'package:get/get.dart';

class MainCurencyController extends GetxController {
  RxBool rememberCurrency = false.obs;
  final currencies = ["swr", "asfgsagfs", "safasfdasfsfa"];

  void goToMainProfile() {
    Get.offNamed("/main_profile");
  }

  ///storage.saveUser(user);
  // Get.to(Home());
}
