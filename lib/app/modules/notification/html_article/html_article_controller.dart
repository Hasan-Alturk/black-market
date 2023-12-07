import 'dart:developer';

import 'package:black_market/app/core/model/Html_article.dart';
import 'package:black_market/app/core/repo/notification_repo.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:get/get.dart';

class HtmlArticleController extends GetxController {
  final NotificationRepo notificationRepo;
  String ida = "";
  String text = "";

  List<HtmlArticleData> articlesData = [];

  HtmlArticleController({required this.notificationRepo});

  @override
  void onInit() {
    getArticles();
    super.onInit();
  }

  Future<List<HtmlArticleData>> getArticles() async {
    try {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // String? id = prefs.getString('id');
      HtmlArticle article = await notificationRepo.getHtmlArticle("416");
      List<HtmlArticleData> articlesList = article.data;
      articlesData.addAll(articlesList);
      // text = articlesData[id].banner;

      update(["HtmlArticle"]);
      return articlesData;
    } on ExceptionHandler catch (e) {
      log("Error: $e");
      update();
      throw ExceptionHandler("Unknown error");
    }
  }
}
