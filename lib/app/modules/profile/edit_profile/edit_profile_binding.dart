import 'package:black_market/app/modules/main/main_home_binding.dart';
import 'package:black_market/app/modules/profile/edit_profile/edit_profile_controller.dart';
import 'package:get/get.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(AuthRepo(Get.find<Dio>()), permanent: true);
    Get.put(EditProfileController());
  }
}
