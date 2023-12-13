import 'dart:developer';

import 'package:black_market/app/core/model/html_article.dart';
import 'package:black_market/app/core/repo/notification_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:get/get.dart';

class HtmlArticleController extends GetxController {
  final NotificationRepo notificationRepo;
  int id = Get.arguments;
  List<HtmlArticleData> articlesData = [];

  HtmlArticleController({required this.notificationRepo});

  @override
  void onInit() {
    getArticles();

    super.onInit();
  }

  Future<List<HtmlArticleData>> getArticles() async {
    try {
      update(["HtmlArticle"]);
      HtmlArticle article =
          await notificationRepo.getHtmlArticle(id.toString());
      List<HtmlArticleData> articlesList = article.data;
      articlesData.addAll(articlesList);
      for (var element in articlesData) {
        log(element.id.toString());
      }
      update(["HtmlArticle"]);
      return articlesData;
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      update();
      throw ExceptionHandler("Unknown error");
    }
  }
}
