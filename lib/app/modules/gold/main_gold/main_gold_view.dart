import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/widgets/gold_calculator_dialog.dart';
import 'package:black_market/app/modules/gold/alloy_view/alloy_view.dart';
import 'package:black_market/app/modules/gold/gold_currency_view/gold_currency_view.dart';
import 'package:black_market/app/modules/gold/gold_view/gold_view.dart';
import 'package:black_market/app/modules/gold/main_gold/main_gold_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          leading: GetBuilder<MainGoldController>(
              id: "goldDialog",
              builder: (_) {
                return IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return GoldCalculatorDialog(
                            karat: controller.karatList,
                            totalGram: controller.totalgramsController.value,
                            totalPaidAmount:
                                controller.totalPaidAmountController.value,
                            selectKarat: (selectedKarat) =>
                                controller.selectKarat(selectedKarat),
                            calculate: controller.calculateTotalWorkmanship,
                            workshipText: controller.totalWorkShip.toString(),
                          );
                        },
                      );
                    },
                    icon: Image.asset(AppAssetIcons.yellowCalculator));
              }),
          title: Text(
            AppStrings.gold,
            style: TextStyle(
              fontSize: 18.sp,
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
                height: 60.h,
                decoration: BoxDecoration(
                    color: AppColors.darkGrey,
                    borderRadius: BorderRadius.circular(16.r)),
                child: TabBar(
                  indicatorPadding: const EdgeInsets.all(5),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: AppColors.yellowNormal,
                    borderRadius: BorderRadius.circular(16.r),
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
      ),
    );
  }
}
