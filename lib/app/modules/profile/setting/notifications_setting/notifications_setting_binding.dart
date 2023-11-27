import 'package:black_market/app/modules/profile/setting/notifications_setting/notifications_setting_controller.dart';
import 'package:get/get.dart';

class NotificationsSettingBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(AuthRepo(Get.find<Dio>()), permanent: true);
    Get.put(NotificationsSettingController());
  }
}
