import 'dart:developer';

import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:black_market/app/core/model/html_article.dart';
import 'package:black_market/app/core/model/articles.dart';
import 'package:black_market/app/core/model/notifications.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:dio/dio.dart';


class NotificationRepo {
  NotificationRepo(this.dio);
  final Dio dio;

  Future<Notifications> getNotification({
    required String startDate,
    required String topics,
    required int page,
  }) async {
    try {
      Map<String, dynamic> queryParameters = {
        'start_date': startDate,
        'topics': topics,
        "page": page,
      };
      Response response = await dio.get(
        "${BaseUrls.baseUrl}/notifications",
        queryParameters: queryParameters,
      );

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

  Future<Articles> getArticle({
    required String startDate,
    required int page,
  }) async {
    try {
      Map<String, dynamic> queryParameters = {
        'start_date': startDate,
        "page": page,
      };
      Response response =
          await dio.get("${BaseUrls.baseUrl}/articles", queryParameters: queryParameters);

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
      Response response = await dio.get("${BaseUrls.baseUrl}/articles/$id");

      HtmlArticle htmlarticle = HtmlArticle.fromJson(response.data);
      log(htmlarticle.firstPageUrl);
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
