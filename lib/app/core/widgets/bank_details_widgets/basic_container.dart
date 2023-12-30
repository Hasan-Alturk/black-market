import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/modules/bank_details/bank_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BasicContainer extends GetView<BankDetailsController> {
  const BasicContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(120.r, 20.r),
              bottomRight: Radius.elliptical(120.r, 20.r))),
      height: 250.h,
      child: Padding(
          padding: EdgeInsets.all(8.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: Get.back,
                      child: CircleAvatar(
                        backgroundColor: AppColors.blackDarkHover,
                        child: Image.asset(
                          AppAssetIcons.arrowLeft,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.blackMarketInEng,
                    style: TextStyle(
                        fontSize: 28.sp,
                        color: AppColors.yellowNormal,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    AppStrings.howMuchInBlackMarket,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.yellowLightActive,
                        fontWeight: FontWeight.bold),
                  ),
                
                ],
              ),
            ],
          )),
    );
  }
}
