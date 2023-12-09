import 'dart:developer';

import 'package:black_market/app/core/model/articles.dart';
import 'package:black_market/app/core/model/notifications.dart';
import 'package:black_market/app/core/plugin/data_format.dart';
import 'package:black_market/app/core/repo/notification_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  PageController pageController = PageController();
  final NotificationRepo notificationRepo;
  List<DataNotifications> notifications = [];
  List<DataArticle> articles = [];

  NotificationController({required this.notificationRepo});
  String startDate = DataFormatApp.getCurrentDate();
  String topics =
      "marketing%2Cnew_marketing%2Cmarketing_1_0_10%2Cgold%2Ccurrencies%2Cnews";
  int page = 1;

  @override
  void onInit() {
    super.onInit();
    getNotification();
    getArticles();
  }

  Future<Notifications> getNotification() async {
    try {
      Notifications notification = await notificationRepo.getNotification(
        startDate:"2022/12/10",
        topics: [
          [
            "marketing",
            "new_marketing",
            "marketing_1_0_10",
            "gold",
            "currencies",
            "news",
          ]
        ],
        // page: 1
      );
      List<DataNotifications> notificationList = notification.data;
      notifications.addAll(notificationList);
      update(["notifications"]);
      for (var element in notifications) {
        log(element.id.toString());
        log(element.createdAt);
      }
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
