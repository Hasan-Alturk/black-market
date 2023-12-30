import 'dart:developer';

import 'package:black_market/app/core/model/time_zone.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:dio/dio.dart';

String baseUrl = "https://worldtimeapi.org/api/timezone/Africa/Cairo";

class TimeZoneRepo {
  final Dio dio;

  TimeZoneRepo({required this.dio});

  Future<DateTime?> getTime() async {
    try {
      Response response = await dio.get(baseUrl);
      Time data = Time.fromJson(response.data);
      DateTime? time = data.datetime;
      return time;
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          throw ExceptionHandler("Time not found");
        }
      }
      throw ExceptionHandler("Unknown error");
    }
  }
}
