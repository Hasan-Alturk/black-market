import 'package:black_market/app/modules/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(AuthRepo(Get.find<Dio>()), permanent: true);
    Get.put(RegisterController(
        //authRepo: Get.find<AuthRepo>(),
        // storageService: Get.find<StorageService>(),
        ));
  }
}
