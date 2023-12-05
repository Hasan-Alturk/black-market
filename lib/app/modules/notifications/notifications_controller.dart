import 'dart:developer';

import 'package:black_market/app/core/model/notifications.dart';
import 'package:black_market/app/core/repo/notification_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  PageController pageController = PageController();
  final NotificationRepo notificationRepo;
  List<Data> notifications = [];

  @override
  void onInit() {
    super.onInit();
    getNotification();
  }

  int pageIndex = 0;

  NotificationsController({required this.notificationRepo});

  void changePage(int pageIndex) {
    this.pageIndex = pageIndex;
    pageController.jumpToPage(pageIndex);

    update(["NotificationsViewGetBuilder"]);

    if (pageIndex == 1) {
      //   GoldBinding().dependencies();
    }
  }

  Future<Notifications> getNotification() async {
    try {
      update();

      Notifications notification = await notificationRepo.getNotification();
      List<Data> notificationList = notification.data;

      for (var element in notificationList) {
        log(element.title);
      }

      return notification;
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      update();

      throw ExceptionHandler("Unknown error");
    }
  }
}
