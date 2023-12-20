import 'dart:developer';

import 'package:black_market/app/core/services/error_handler.dart';
import 'package:black_market/app/modules/currencies/currencies_binding.dart';
import 'package:black_market/app/modules/favourite/favourite_binding.dart';
import 'package:black_market/app/modules/gold/main_gold/main_gold_binding.dart';
import 'package:black_market/app/modules/login/login_binding.dart';
import 'package:black_market/app/modules/profile/main_profile/main_profile_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainHomeController extends GetxController {
  // PageController pageController = PageController();

  int pageIndex = 3;
  bool tokenChecked = false;
@override
  Future<void> onInit() async {
    super.onInit();
   tokenChecked = await checkToken();
  }
  Future<void> changePage(int pageIndex) async {
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
      log("token ${tokenChecked}");
      if(tokenChecked){
      LoginBinding().dependencies();

      }else{
      MainProfileBinding().dependencies();

      }
      // MainProfileBinding().dependencies();
      // MainGoldBinding().deleteController();
      // FavouriteBinding().deleteController();
      // CurrenciesBinding().deleteController();
    }
  }

  Future<bool> checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null && token.isNotEmpty) {
      // await getUserSetting();
      return false;

      // Get.offAllNamed("/main_home");
    } else {
      // Get.offAllNamed("/main_home");
      // Get.offAllNamed("/login");
      return true;
    }
  }
}
