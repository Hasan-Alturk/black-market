import 'dart:developer';

import 'package:black_market/app/core/model/articles.dart';
import 'package:black_market/app/core/model/notifications.dart';
import 'package:black_market/app/core/plugin/data_format.dart';
import 'package:black_market/app/core/repo/notification_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final NotificationRepo notificationRepo;
  PageController pageController = PageController();
  List<DataNotifications> notifications = [];
  List<DataArticle> articles = [];
  bool isLoading = false;

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
      update(["notifications"]);
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
      // for (var element in articles) {
      //   log(element.id.toString());
      //   log(element.shortDescription);
      // }

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
