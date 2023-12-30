import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/modules/currencies/currencies_view.dart';
import 'package:black_market/app/modules/favourite/favourite_view.dart';
import 'package:black_market/app/modules/gold/main_gold/main_gold_view.dart';
import 'package:black_market/app/modules/main/main_home_controller.dart';
import 'package:black_market/app/modules/profile/main_profile/main_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainHomeView extends GetView<MainHomeController> {
  MainHomeView({super.key});
  final screens = [
    const MainProfileView(),
    const FavouriteView(),
    const MainGoldView(),
    const CurrenciesView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: GetBuilder<MainHomeController>(
          id: "MainHomeViewScreenGetBuilder",
          builder: (_) {
            return screens[controller.pageIndex];
          }),
      bottomNavigationBar: GetBuilder<MainHomeController>(
        id: "MainHomeViewGetBuilder",
        builder: (_) {
          return Container(
            height: 70.h,
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
              child: BottomNavigationBar(
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
              ),
            ),
          );
        },
      ),
    );
  }
}
