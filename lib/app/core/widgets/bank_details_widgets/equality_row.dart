import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/modules/bank_details/bank_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EqualityRow extends GetView<BankDetailsController> {
  const EqualityRow({super.key});

  @override
  Widget build(BuildContext context) {
       return GetBuilder<BankDetailsController>(
        id: "totalAmount",
        builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150.w,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                padding: const EdgeInsets.all(5),
                child: Text(
                  controller.latestCurrencyList.isNotEmpty
                      ? "${controller.totalAmount.toStringAsFixed(2)} ${controller.egyptCurrency!.name!.split('/').first}"
                      : "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.blackNormal,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Image.asset(AppAssetIcons.equal),
              SizedBox(
                width: 10.w,
              ),
              Container(
                width: 100.w,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.r))),
                padding: const EdgeInsets.all(5),
                child: Text(
                  controller.amountController.value.text.isNotEmpty
                      ? " ${num.parse(controller.amountController.value.text)} ${controller.currency.first.currencyName.split('/').first}"
                      : controller.currency.isNotEmpty
                          ? "1 ${controller.currency.first.currencyName.split('/').first}"
                          : "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.blackNormal,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          );
        });
  }
}