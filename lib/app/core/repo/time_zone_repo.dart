import 'dart:developer';

import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:black_market/app/core/model/time_zone.dart';
import 'package:black_market/app/core/model/time_zone_new.dart';
import 'package:black_market/app/core/services/error_handler.dart';
import 'package:dio/dio.dart';


class TimeZoneRepo {
  final Dio dio;

  TimeZoneRepo({required this.dio});

  Future<DateTime> getTime() async {
    try {
      Response response = await dio.get(BaseUrls.timeZoneUrl);
      TimeZone data = TimeZone.fromJson(response.data);
      DateTime? time = DateTime.parse(data.dateTime!);
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
