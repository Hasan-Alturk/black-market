import 'package:black_market/app/modules/currencies/currencies_binding.dart';
import 'package:black_market/app/modules/favourite/favourite_binding.dart';
import 'package:black_market/app/modules/gold/main_gold/main_gold_binding.dart';
import 'package:black_market/app/modules/profile/main_profile/main_profile_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHomeController extends GetxController {
  PageController pageController = PageController();

  int pageIndex = 3;

  void changePage(int pageIndex) {
    this.pageIndex = pageIndex;
    // pageController.jumpToPage(pageIndex);

    update(["MainHomeViewGetBuilder", "MainHomeViewScreenGetBuilder"]);

    if (pageIndex == 1) {
      FavouriteBinding().dependencies();
      MainGoldBinding().deleteController();
      CurrenciesBinding().deleteController();

      MainProfileBinding().deleteController();
    } else if (pageIndex == 2) {
      MainGoldBinding().dependencies();
      MainProfileBinding().deleteController();
      FavouriteBinding().deleteController();
      CurrenciesBinding().deleteController();
    } else if (pageIndex == 3) {
      CurrenciesBinding().dependencies();
      MainProfileBinding().deleteController();
      MainGoldBinding().deleteController();
      FavouriteBinding().deleteController();
    } else if (pageIndex == 0) {
      MainProfileBinding().dependencies();
      MainGoldBinding().deleteController();
      FavouriteBinding().deleteController();
      CurrenciesBinding().deleteController();
    }
  }
}
