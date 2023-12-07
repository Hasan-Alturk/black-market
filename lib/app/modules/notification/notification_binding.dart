import 'package:black_market/app/core/repo/notification_repo.dart';
import 'package:black_market/app/modules/notification/notification_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationController(
        notificationRepo: Get.put(NotificationRepo(Get.find<Dio>()))));
  }
}
