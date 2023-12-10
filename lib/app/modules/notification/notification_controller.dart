import 'dart:developer';

import 'package:black_market/app/core/model/articles.dart';
import 'package:black_market/app/core/model/notifications.dart';
import 'package:black_market/app/core/plugin/data_format_App.dart';
import 'package:black_market/app/core/repo/notification_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final NotificationRepo notificationRepo;
  PageController pageController = PageController();
  bool isLoading = false;
  List<DataNotifications> notifications = [];
  List<DataArticle> articles = [];
  NotificationController({required this.notificationRepo});
  String startDate = DataFormatApp.getCurrentDate();
  List<String> topics = [
    "marketing",
    "new_marketing",
    "marketing_1_0_10",
    "gold",
    "currencies",
    "news",
  ];
  int page = 1;
  int pageArticle = 1;

  @override
  void onInit() {
    super.onInit();
    getNotification();
    getArticles();
  }

  Future<void> getNotification() async {
    try {
      isLoading = true;
      update(["notifications"]);
      Notifications notification = await notificationRepo.getNotification(
        startDate: startDate,
        topics: topics[2],
        page: page,
      );
      List<DataNotifications> notificationList = notification.data;
      notifications.addAll(notificationList);
      page++;
      isLoading = false;
      log("getNotification");

      update(["notifications"]);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      update();
      throw ExceptionHandler("Unknown error");
    }
  }

  Future<void> getNotificationAgain() async {
    try {
      isLoading = true;
      update(["notifications"]);
      Notifications notification = await notificationRepo.getNotification(
        startDate: startDate,
        topics: topics[2],
        page: 1,
      );
      List<DataNotifications> notificationList = notification.data;
      notifications.addAll(notificationList);
      isLoading = false;
      log("getNotificationAgain");

      update(["notifications"]);
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      update();
      throw ExceptionHandler("Unknown error");
    }
  }

  Future<Articles> getArticles() async {
    try {
      isLoading = true;
      update(["articles"]);

      Articles article = await notificationRepo.getArticle(
        startDate: startDate,
        page: pageArticle,
      );
      List<DataArticle> articlesList = article.data;
      articles.addAll(articlesList);
      isLoading = false;
      log("getArticles");

      update(["articles"]);

      return article;
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      update();
      throw ExceptionHandler("Unknown error");
    }
  }

  Future<Articles> getArticlesAgain() async {
    try {
      isLoading = true;
      update(["articles"]);

      Articles article = await notificationRepo.getArticle(
        startDate: startDate,
        page: 1,
      );
      List<DataArticle> articlesList = article.data;
      articles.addAll(articlesList);
      isLoading = false;
      log("getArticlesAgain");

      update(["articles"]);

      return article;
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      update();
      throw ExceptionHandler("Unknown error");
    }
  }

  void goToHtmlArticle(int id) {
    Get.toNamed("/html_article", arguments: id);
  }
}
