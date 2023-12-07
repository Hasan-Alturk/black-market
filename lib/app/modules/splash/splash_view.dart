import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
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
        child: Center(
          child: SizedBox(
            height: 279.h,
            width: 279.w,
            child: Image.asset(
              AppAssetImage.imageOnBoarding,
            ),
          ),
        ),
      ),
    );
  }
}
