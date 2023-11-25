import 'package:black_market/app/modules/favourite/favourite_binding.dart';
import 'package:black_market/app/modules/gold/gold_binding.dart';
import 'package:black_market/app/modules/profile/main_profile/main_profile_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHomeController extends GetxController {
  PageController pageController = PageController();

  int pageIndex = 0;

  void changePage(int pageIndex) {
    this.pageIndex = pageIndex;
    pageController.jumpToPage(pageIndex);

    update(["MainHomeViewGetBuilder"]);

    if (pageIndex == 1) {
      GoldBinding().dependencies();
    } else if (pageIndex == 2) {
      FavouriteBinding().dependencies();
    } else if (pageIndex == 3) {
      MainProfileBinding().dependencies();
    }
  }
}
