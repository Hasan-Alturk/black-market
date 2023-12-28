import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LastUpdateContainer extends GetView<CurrenciesController> {
  const LastUpdateContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CurrenciesController>(
      id: "lastUpdateContainer",
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (controller.currency.isNotEmpty)
                controller.currency.first.blackMarketBuyPrice != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.blackMarket,
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.lightGrey),
                          ),
                          Text(
                            controller.currency.isNotEmpty
                                ? "${controller.currency.first.blackMarketBuyPrice} ج.م"
                                : "",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.yellowDark),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              if (controller.currency.isNotEmpty)
                controller.currency.first.blackMarketBuyPrice != null
                    ? Container(
                        height: 30.h,
                        width: 1,
                        color: AppColors.lighterGrey,
                      )
                    : const SizedBox.shrink(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.lastUpdate,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.lightGrey),
                  ),
                  Text(
                    controller.currency.isNotEmpty
                        ? " منذ ${controller.currency.first.lastUpdate} دقيقة "
                        : "",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: AppColors.darkGrey,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              Container(
                height: 30.h,
                width: 1,
                color: AppColors.lighterGrey,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.bankPrice,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.lightGrey),
                  ),
                  Text(
                    controller.currency.isNotEmpty
                        ? "${controller.currency.first.livePrice} ج.م"
                        : "",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: AppColors.darkGrey,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
