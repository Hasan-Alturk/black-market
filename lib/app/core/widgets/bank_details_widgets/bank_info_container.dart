import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:black_market/app/modules/bank_details/bank_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BankInfoContainer extends GetView<BankDetailsController> {
  const BankInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BankDetailsController>(
        id: "bankInfo",
        builder: (_) {
          return Container(
              width: 350.w,
              decoration: BoxDecoration(
                color: AppColors.yellowLight,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          controller.bankData.isEmpty
                              ? ""
                              : controller.bankData.first.bankName,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.darkGrey),
                        ),
                        controller.bankData.isEmpty
                            ? Image.asset(
                                AppAssetImage.bankMasr,
                                height: 25.h,
                                width: 25.w,
                              )
                            : Image.network(
                                BaseUrls.storageUrl +
                                    controller.bankData.first.bankIcon,
                                height: 25.h,
                                width: 25.w,
                              ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
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
                            )
                          ],
                        ),
                        Container(
                          height: 45.h,
                          width: 1,
                          color: AppColors.lighterGrey,
                        ),
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
                          height: 45.h,
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
                                  ? "${controller.currency.first.sellPrice} ج.م"
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
                  ),
                ],
              ));
        });
  }
}
