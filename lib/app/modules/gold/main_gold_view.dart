import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/modules/gold/alloy_view/alloy_view.dart';
import 'package:black_market/app/modules/gold/gold_calculator_dialog.dart';
import 'package:black_market/app/modules/gold/main_gold_controller.dart';
import 'package:black_market/app/modules/gold/gold_currency_view/gold_currency_view.dart';
import 'package:black_market/app/modules/gold/gold_view/gold_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainGoldView extends GetView<MainGoldController> {
  const MainGoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return GoldCalculatorDialog(
                        // text: AppStrings.areYouSureToLogout,
                        // contentButton: AppStrings.logout,
                        // onTap: Get.back,
                        // onPressed: () => (),
                        );
                  },
                );
              },
              icon: Image.asset(AppAssetIcons.yellowCalculator)),
          title: Text(
            AppStrings.gold,
            style: TextStyle(
              fontSize: 18,
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: AppColors.blackNormalHover,
        ),
        backgroundColor: AppColors.blackNormalHover,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: AppColors.darkGrey,
                    borderRadius: BorderRadius.circular(16)),
                child: TabBar(
                  indicatorPadding: const EdgeInsets.all(5),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: AppColors.yellowNormal,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: AppColors.white,
                  unselectedLabelStyle: TextStyle(
                      fontFamily: 'Almarai',
                      color: AppColors.white,
                      fontWeight: FontWeight.w700),
                  labelStyle: TextStyle(
                      fontFamily: 'Almarai',
                      color: AppColors.blackNormal,
                      fontWeight: FontWeight.w700),
                  dividerColor: Colors.black,
                  tabs: [
                    Tab(text: AppStrings.coins),
                    Tab(text: AppStrings.alloys),
                    Tab(text: AppStrings.gold),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   height: context.screenHeight * 0.001,
            // ),
            const Expanded(
                child: TabBarView(
              children: [
                GoldCurrencyView(),
                AlloyView(),
                GoldView(),
              ],
            ))
          ],
        ),
        // body: Center(child: Text("Gold")),
      ),
    );
  }
}
