import 'package:black_market/app/core/repo/notification_repo.dart';
import 'package:black_market/app/modules/notifications/notifications_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationsController(
        notificationRepo: Get.put(NotificationRepo(Get.find<Dio>()))));
  }
}
