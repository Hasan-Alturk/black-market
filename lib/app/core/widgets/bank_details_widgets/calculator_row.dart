import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:black_market/app/core/widgets/select_currency_dialog.dart';
import 'package:black_market/app/modules/bank_details/bank_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CalculatorRow extends GetView<BankDetailsController> {
  const CalculatorRow({super.key});

  @override
  Widget build(BuildContext context) {
     return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.r)),
              child: Row(
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    controller.bankData.isNotEmpty
                        ? controller.egyptCurrency!.code!.toUpperCase()
                        : "",
                    style: TextStyle(
                        color: AppColors.gray,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  controller.latestCurrencyList.isNotEmpty
                      ? Image.network(
                          BaseUrls.storageUrl +
                              controller.egyptCurrency!.icon.toString(),
                          height: 15.h,
                          width: 15.w,
                        )
                      : Image.asset(
                          AppAssetImage.bankMasr,
                          height: 15.h,
                          width: 15.w,
                        ),
                ],
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Image.asset(AppAssetIcons.yellowDollar),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SelectCurrencyDialog(
                        currencyList: controller.bankData,
                        onTap: (currencyId) {
                          controller.getCurrencyInBank(currencyId);

                          Get.back();
                        });
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Image.asset(AppAssetIcons.arrowDown),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      controller.currency.isNotEmpty
                          ? controller.currency.first.currencyCode.toUpperCase()
                          : "",
                      style: TextStyle(
                          color: AppColors.gray,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    controller.currency.isNotEmpty
                        ? Image.network(
                            BaseUrls.storageUrl +
                                controller.currency.first.currencyIcon,
                            width: 15.w,
                            height: 15.h,
                          )
                        : Image.asset(
                            AppAssetImage.avatar,
                            height: 15.h,
                            width: 15.w,
                          )
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: AppColors.yellowNormal,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.calculator,
                style: TextStyle(
                    color: AppColors.blackNormal, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 5.w,
              ),
              Image.asset(AppAssetIcons.calculator),
            ],
          ),
        ),
      ],
    );
  }
}