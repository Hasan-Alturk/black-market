import 'package:get/get.dart';

class CurrenciesController extends GetxController {
  void goToBankDetails() {
    Get.offNamed("/bank_details");
  }

  void goToNotification() {
    Get.offNamed("/notifications");
  }
}
