import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowNormal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 140.h,
                width: 140.w,
                child: Image.asset(
                  AppAssetImage.imageOnBoarding,
                ),
              ),
            ),
            Text(
              AppStrings.blackMarketInEng,
              style: TextStyle(
                  color: AppColors.blackDark,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.h,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GetBuilder<SplashController>(
                builder: (controller) {
                  if (controller.isLoading) {
                    return CircularProgressIndicator(
                      color: AppColors.blackDark,
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
