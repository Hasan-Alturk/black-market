import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:black_market/app/core/widgets/custom_alarte_dialog.dart';
import 'package:black_market/app/core/widgets/custom_container_profile.dart';
import 'package:black_market/app/modules/profile/main_profile/main_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainProfileView extends GetView<MainProfileController> {
  const MainProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormalHover,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                AppStrings.profile,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            CircleAvatar(
              radius: 41.0.r,
              child: Image.network("${BaseUrls.storageUrl}users/default.png"),
            ),
            SizedBox(height: 15.h),
            Text(
              controller.name,
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.yellowNormal,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            CustomContainerProfile(
              text: AppStrings.shareTheApp,
              stringIcon: AppAssetIcons.share,
              onTap: () {},
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomContainerProfile(
              text: AppStrings.aboutApp,
              stringIcon: AppAssetIcons.info,
              onTap: () {},
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomContainerProfile(
              text: AppStrings.mainCurrency,
              stringIcon: AppAssetIcons.dollar,
              onTap: () => controller.goToMainCuurency(),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomContainerProfile(
              text: AppStrings.setting,
              stringIcon: AppAssetIcons.setting,
              onTap: () {
                controller.goToMainSetting();
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return GetBuilder<MainProfileController>(
                      id: "LogOut",
                      builder: (context) {
                        return CustomAlarteDialog(
                          text: AppStrings.areYouSureToLogout,
                          contentButton: AppStrings.logout,
                          isLoading: controller.isLoading,
                          onTap: Get.back,
                          onPressed: () => controller.logOut(),
                        );
                      },
                    );
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.logout,
                    style: TextStyle(
                      color: AppColors.red,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Image.asset(
                    AppAssetIcons.logout,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
