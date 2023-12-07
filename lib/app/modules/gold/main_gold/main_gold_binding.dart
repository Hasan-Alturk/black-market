import 'package:black_market/app/core/repo/gold_repo.dart';
import 'package:black_market/app/modules/gold/main_gold/main_gold_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MainGoldBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GoldRepo(Dio()), permanent: true);
    Get.put(MainGoldController(
      goldRepo: Get.find<GoldRepo>(),
    ));
  }
}
