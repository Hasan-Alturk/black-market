import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/modules/bank_details/bank_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CalculateText extends GetView<BankDetailsController> {
  const CalculateText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 200.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.greyNormal,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(children: [
        ElevatedButton(
          onPressed: () {
            controller.calculateTotalPrice();
          },
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(EdgeInsets.all(4)),
            backgroundColor: MaterialStatePropertyAll(AppColors.yellowNormal),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.zero,
                    bottomLeft: Radius.circular(8.r),
                    bottomRight: Radius.zero),
              ),
            ),
          ),
          child: Text(
            AppStrings.calculate,
            style: TextStyle(
                color: AppColors.blackNormal, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          width: 100.w,
          child: TextField(
            controller: controller.amountController.value,
            keyboardType: TextInputType.number,
            cursorColor: AppColors.yellowNormal,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColors.greyNormalActive),
            textAlign: TextAlign.right,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: AppStrings.enterAmount,
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.greyNormalActive)),
          ),
        ),
      ]),
    );
  }
}
