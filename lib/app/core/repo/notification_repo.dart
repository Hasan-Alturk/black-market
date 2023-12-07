import 'dart:developer';

import 'package:black_market/app/core/model/Html_article.dart';
import 'package:black_market/app/core/model/articles.dart';
import 'package:black_market/app/core/model/notifications.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:dio/dio.dart';

String baseUrl = "https://voipsys.space/api";

class NotificationRepo {
  NotificationRepo(this.dio);
  final Dio dio;

  Future<Notifications> getNotification() async {
    try {
      Response response = await dio.get(
          "$baseUrl/notifications?start_date=2023-10-07&topics=marketing%2Cnew_marketing%2Cmarketing_1_0_10%2Cgold%2Ccurrencies%2Cnews");

      Notifications notifications = Notifications.fromJson(response.data);
      return notifications;
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          throw ExceptionHandler("notifications not found");
        }
      }

      throw ExceptionHandler("Unknown error");
    }
  }

  Future<Articles> getArticle() async {
    try {
      Response response = await dio.get("$baseUrl/articles");

      Articles articles = Articles.fromJson(response.data);
      return articles;
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          throw ExceptionHandler("notifications not found");
        }
      }

      throw ExceptionHandler("Unknown error");
    }
  }

  Future<HtmlArticle> getHtmlArticle(String id) async {
    try {
      Response response = await dio.get("$baseUrl/articles/$id");

      HtmlArticle htmlarticle = HtmlArticle.fromJson(response.data);
      return htmlarticle;
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          throw ExceptionHandler("notifications not found");
        }
      }

      throw ExceptionHandler("Unknown error");
    }
  }
}
