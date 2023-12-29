import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/widgets/currencies_view_widgets/chart_black.dart';
import 'package:black_market/app/core/widgets/currencies_view_widgets/chart_live.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChartStack extends GetView<CurrenciesController> {
  ChartStack({super.key});
  DateTime currentDate = DateTime.now();
  late int dayOfMonth = currentDate.day;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 35.w, top: 35.h),
          child: GetBuilder<CurrenciesController>(
            id: "text_chart",
            builder: (_) {
              return Text(
                controller.textChart,
                style: TextStyle(
                  color: AppColors.yellowDark,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.normal,
                ),
              );
            },
          ),
        ),
        GetBuilder<CurrenciesController>(
          id: "chart",
          builder: (_) {
            if (controller.valueTapBar == 0) {
              controller.getHistoricalCurrencyLivePrices(
                  currentDate.subtract(Duration(days: dayOfMonth)).toString());
              controller.textChart = "";
              return ChartLive(
                livePricesMap: controller.livePricesMap,
              );
            } else if (controller.valueTapBar == 1) {
              controller.getHistoricalCurrencyBlackPrices(
                  currentDate.subtract(Duration(days: dayOfMonth)).toString());
              return ChartBlack(
                blackPricesMap: controller.blackPricesMap,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
