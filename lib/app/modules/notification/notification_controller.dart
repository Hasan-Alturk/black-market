import 'dart:developer';

import 'package:black_market/app/core/model/articles.dart';
import 'package:black_market/app/core/model/notifications.dart';
import 'package:black_market/app/core/repo/notification_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:black_market/app/modules/splash/shared.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  PageController pageController = PageController();
  final NotificationRepo notificationRepo;
  List<DataNotifications> notifications = [];
  List<DataArticle> articles = [];
  int id = 0;

  NotificationController({required this.notificationRepo});

  @override
  void onInit() {
    super.onInit();
    getNotification();
    getArticles();
  }

  Future<Notifications> getNotification() async {
    try {
      Notifications notification = await notificationRepo.getNotification();
      List<DataNotifications> notificationList = notification.data;
      notifications.addAll(notificationList);
      update(["notifications"]);
      return notification;
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      update();
      throw ExceptionHandler("Unknown error");
    }
  }

  Future<Articles> getArticles() async {
    try {
      Articles article = await notificationRepo.getArticle();
      List<DataArticle> articlesList = article.data;
      articles.addAll(articlesList);
      update(["articles"]);
      
      return article;
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      update();
      throw ExceptionHandler("Unknown error");
    }
  }

  void goToHtmlArticle() {
    Get.toNamed("/html_article");
  }
}
