import 'dart:developer';

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

      //  log(response.data.toString());
      return notifications;
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          throw ExceptionHandler("Bank not found");
        }
      }

      throw ExceptionHandler("Unknown error");
    }
  }
}
