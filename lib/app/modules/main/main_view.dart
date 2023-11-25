import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/modules/favourite/favourite_view.dart';
import 'package:black_market/app/modules/gold/gold_view.dart';
import 'package:black_market/app/modules/home/home_view.dart';
import 'package:black_market/app/modules/main/main_home_controller.dart';
import 'package:black_market/app/modules/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends GetView<MainHomeController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: const [
            ProfileView(),
            FavouriteView(),
            GoldView(),
            HomeView(),
          ],
        ),
        backgroundColor: AppColors.blackDarkActive,
        bottomNavigationBar: GetBuilder<MainHomeController>(
          id: "MainHomeViewGetBuilder",
          builder: (_) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(18),
                topLeft: Radius.circular(18),
              ),
              child: BottomNavigationBar(
                backgroundColor: AppColors.darkGrey,
                selectedItemColor: AppColors.yellowNormalActive,
                items: [
                  BottomNavigationBarItem(
                      icon: Image.asset(AppAssetIcons.profile),
                      label: AppStrings.profile,
                      backgroundColor: AppColors.darkGrey,
                      activeIcon: Image.asset(AppAssetIcons.yellowProfile)),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      AppAssetIcons.heart,
                    ),
                    label: AppStrings.favourite,
                    activeIcon: Image.asset(AppAssetIcons.yellowHeart),
                    backgroundColor: AppColors.darkGrey,
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(AppAssetIcons.gold),
                    label: AppStrings.gold,
                    activeIcon: Image.asset(AppAssetIcons.yellowProfile),
                    backgroundColor: AppColors.darkGrey,
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(AppAssetIcons.dollar),
                    label: AppStrings.coins,
                    activeIcon: Image.asset(AppAssetIcons.yellowDollar),
                    backgroundColor: AppColors.darkGrey,
                  ),
                ],
              ),
            );
          },
        ));
  }
}
