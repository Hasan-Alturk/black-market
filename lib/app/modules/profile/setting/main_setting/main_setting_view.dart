import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/widgets/custom_alarte_dialog.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/core/widgets/custom_container_profile.dart';
import 'package:black_market/app/modules/profile/setting/main_setting/main_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainSettingView extends GetView<MainSettingController> {
  const MainSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormalHover,
      appBar: CustomAppBar(
        text: AppStrings.setting,
        onTap: () => Get.back(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 38.h,
            ),
            CustomContainerProfile(
              text: AppStrings.changePassword,
              stringIcon: AppAssetIcons.lock,
              onTap: () => controller.goToChangePassword(),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomContainerProfile(
              text: AppStrings.preferredBanks,
              stringIcon: AppAssetIcons.bank,
              onTap: () {},
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomContainerProfile(
              text: AppStrings.preferredCurrencies,
              stringIcon: AppAssetIcons.dollar,
              onTap: () {},
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomContainerProfile(
              text: AppStrings.language,
              stringIcon: AppAssetIcons.global,
              onTap: () {
                controller.goToLanguage();
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomContainerProfile(
              text: AppStrings.notificationsSetting,
              stringIcon: AppAssetIcons.note,
              onTap: () {
                controller.goToNotificationsSetting();
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomAlarteDialog(
                      isLoading: false,
                      text: AppStrings.areYouSureTodDeleteAccount,
                      contentButton: AppStrings.deleteAccount,
                      onTap: Get.back,
                      onPressed: () => (),
                    );
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.deleteAccount,
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
                    AppAssetIcons.delete,
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
