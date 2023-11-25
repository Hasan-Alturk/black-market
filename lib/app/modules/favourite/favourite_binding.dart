import 'package:black_market/app/modules/favourite/favourite_controller.dart';
import 'package:get/get.dart';

class FavouriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavouriteController());
  }
}
