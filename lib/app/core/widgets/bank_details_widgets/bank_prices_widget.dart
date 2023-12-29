import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/modules/bank_details/bank_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BankPricesWidget extends GetView<BankDetailsController> {
  const BankPricesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BankDetailsController>(
        id: "bankPrices",
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      AppStrings.sell,
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: AppColors.darkBlack,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      controller.currency.isNotEmpty
                          ? "${controller.currency[0].sellPrice} ج.م"
                          : "",
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: AppColors.darkBlack,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Container(
                  height: 40.h,
                  width: 1,
                  color: AppColors.yellowDark,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.buy,
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: AppColors.darkBlack,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      controller.currency.isNotEmpty
                          ? "${controller.currency[0].buyPrice} ج.م"
                          : "",
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: AppColors.darkBlack,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
