import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabBarPrice extends GetView<CurrenciesController> {
  const TabBarPrice({required this.length, required this.tabs, super.key});
  final int length;
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 290.w,
        height: 30.h,
        decoration: BoxDecoration(
            color: AppColors.yellowNormal,
            borderRadius: BorderRadius.circular(30.r)),
        child: DefaultTabController(
          length: length,
          initialIndex: 0,
          child: TabBar(
            labelColor: AppColors.yellowNormal,
            unselectedLabelColor: AppColors.gray,
            tabs: tabs,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            onTap: (value) {
              if (value == 0) {
                controller.valueTapBarPrice = value;
              } else {
                controller.valueTapBarPrice = value;
              }
            },
            indicator: BubbleTabIndicator(
              indicatorHeight: 25.0.h,
              indicatorColor: AppColors.gray,
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
        ),
      ),
    );
  }
}
