import 'package:black_market/app/modules/currencies/currencies_binding.dart';
import 'package:black_market/app/modules/favourite/favourite_binding.dart';
import 'package:black_market/app/modules/gold/gold_binding.dart';
import 'package:black_market/app/modules/profile/main_profile/main_profile_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHomeController extends GetxController {
  PageController pageController = PageController();
  int pageIndex = 3;
  void changePage(int pageIndex) {
    this.pageIndex = pageIndex;

    pageController.jumpToPage(
      pageIndex,

      // duration: const Duration(milliseconds: 500),
      // curve: Curves.ease,
    );
    update();
    if (pageIndex == 0) {
      print(pageIndex);

      FavouriteBinding().dependencies();
    } else if (pageIndex == 1) {
      GoldBinding().dependencies();
      print(pageIndex);
    } else if (pageIndex == 2) {
      print(pageIndex);

      MainProfileBinding().dependencies();
    } else if (pageIndex == 3) {
      print(pageIndex);

      CurrenciesBinding().dependencies();
    }
  }
}
