import 'package:black_market/app/modules/splash/splash_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Dio(), permanent: true);
    Get.put(SplashController());
  }
}
