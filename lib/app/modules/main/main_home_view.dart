import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/modules/currencies/currencies_view.dart';
import 'package:black_market/app/modules/favourite/favourite_view.dart';
import 'package:black_market/app/modules/gold/main_gold/main_gold_view.dart';
import 'package:black_market/app/modules/login/login_view.dart';
import 'package:black_market/app/modules/main/main_home_controller.dart';
import 'package:black_market/app/modules/profile/main_profile/main_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHomeView extends GetView<MainHomeController> {
  MainHomeView({super.key});

  final screens1 = [
    LoginView(),
    const FavouriteView(),
    const MainGoldView(),
    const CurrenciesView(),
  ];
  final screens = [
    const MainProfileView(),
    const FavouriteView(),
    const MainGoldView(),
    const CurrenciesView(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainHomeController>(
          id: "MainHomeViewScreenGetBuilder",
          builder: (_) {
            return screens[controller.pageIndex];
            //  controller.tokenChecked
            //     ? screens1[controller.pageIndex]
            //     : screens[controller.pageIndex];
          }),

      // PageView(
      //   physics: const NeverScrollableScrollPhysics(),
      //   controller: controller.pageController,
      //   children: const [

      //   ],
      // ),
      bottomNavigationBar: GetBuilder<MainHomeController>(
        id: "MainHomeViewGetBuilder",
        builder: (_) {
          return BottomNavigationBar(
            onTap: controller.changePage,
            currentIndex: controller.pageIndex,
            selectedItemColor: AppColors.yellowNormalActive,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(AppAssetIcons.profile),
                  label: AppStrings.profile,
                  backgroundColor: AppColors.gray,
                  activeIcon: Image.asset(AppAssetIcons.yellowProfile)),
              BottomNavigationBarItem(
                icon: Image.asset(AppAssetIcons.heart),
                label: AppStrings.favourite,
                activeIcon: Image.asset(AppAssetIcons.yellowHeart),
                backgroundColor: AppColors.gray,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppAssetIcons.gold),
                label: AppStrings.gold,
                activeIcon: Image.asset(AppAssetIcons.yellowGold),
                backgroundColor: AppColors.gray,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppAssetIcons.dollar),
                label: AppStrings.coins,
                activeIcon: Image.asset(AppAssetIcons.yellowDollar),
                backgroundColor: AppColors.gray,
              ),
            ],
          );
        },
      ),
    );
  }
}
