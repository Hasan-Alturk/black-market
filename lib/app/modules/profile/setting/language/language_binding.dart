import 'package:black_market/app/modules/profile/setting/language/language_controller.dart';
import 'package:get/get.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(AuthRepo(Get.find<Dio>()), permanent: true);
    Get.put(LanguagegController());
  }
}
