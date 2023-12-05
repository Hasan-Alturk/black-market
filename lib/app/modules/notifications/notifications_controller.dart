import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  PageController pageController = PageController();

  int pageIndex = 0;

  void changePage(int pageIndex) {
    this.pageIndex = pageIndex;
    pageController.jumpToPage(pageIndex);

    update(["NotificationsViewGetBuilder"]);

    if (pageIndex == 1) {
      //   GoldBinding().dependencies();
    }

  }

  void goToHome() {
    Get.offNamed("/main_home");
  }
}
