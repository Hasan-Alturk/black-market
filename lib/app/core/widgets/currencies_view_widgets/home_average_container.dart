import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeAverageContainer extends GetView<CurrenciesController> {
  const HomeAverageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 350.w,
      decoration: BoxDecoration(
        color: AppColors.yellowNormal,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          GetBuilder<CurrenciesController>(
              id: "averageContainer",
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Image.asset(AppAssetIcons.calculator),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.sell,
                            style: TextStyle(
                                color: AppColors.darkBlack,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "${controller.avgSellPrice.toStringAsFixed(2)} ج.م ",
                            style: TextStyle(
                                color: AppColors.darkBlack,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Container(
                        height: 30.h,
                        width: 1,
                        color: AppColors.yellowDark,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.buy,
                            style: TextStyle(
                                color: AppColors.darkBlack,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "${controller.avgBuyPrice.toStringAsFixed(2)} ج.م ",
                            style: TextStyle(
                                color: AppColors.darkBlack,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Container(
                        height: 30.h,
                        width: 1,
                        color: AppColors.yellowDark,
                      ),
                      Text(
                        AppStrings.avgPrice,
                        style: TextStyle(
                            color: AppColors.darkBlack,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
