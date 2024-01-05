// ignore_for_file: must_be_immutable

import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/widgets/currencies_view_widgets/chart_black.dart';
import 'package:black_market/app/core/widgets/currencies_view_widgets/chart_price.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChartStack extends GetView<CurrenciesController> {
  const ChartStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 50.w, top: 35.h),
          child: GetBuilder<CurrenciesController>(
            id: "text_chart",
            builder: (_) {
              return Text(
                controller.textChart,
                style: TextStyle(
                  color: AppColors.yellowDark,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              );
            },
          ),
        ),
        GetBuilder<CurrenciesController>(
          id: "chart",
          builder: (_) {
            if (controller.valueTapBarPrice == 0 &&
                controller.valueTapBarDate == 0) {
              controller.textChart = "";
              controller.getHistoricalCurrencyLivePrices(
                controller.time.subtract(const Duration(days: 7)).toString(),
              );
              return ChartPrice(
                livePricesMap: controller.livePricesMap,
              );
            } else if (controller.valueTapBarPrice == 0 &&
                controller.valueTapBarDate == 1) {
              controller.textChart = "";
              controller.getHistoricalCurrencyLivePrices(
                controller.time
                    .subtract(
                      const Duration(days: 30),
                    )
                    .toString(),
              );

              return ChartPrice(
                livePricesMap: controller.livePricesMap,
              );
            } else if (controller.valueTapBarPrice == 1 &&
                controller.valueTapBarDate == 0) {
              controller.getHistoricalCurrencyBlackPrices(
                controller.time.subtract(const Duration(days: 7)).toString(),
              );
              return ChartBlack(
                blackPricesMap: controller.blackPricesMap,
              );
            } else if (controller.valueTapBarPrice == 1 &&
                controller.valueTapBarDate == 1) {
              controller.getHistoricalCurrencyBlackPrices(
                controller.time.subtract(const Duration(days: 30)).toString(),
              );
              return ChartBlack(
                blackPricesMap: controller.blackPricesMap,
              );
            } else {
              return CircularProgressIndicator(
                color: AppColors.yellowDark,
              );
            }
          },
        ),
      ],
    );
  }
}
