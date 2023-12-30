import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/core/widgets/custom_container_profile.dart';
import 'package:black_market/app/modules/profile/setting/main_setting/main_setting_controller.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 38.h,
              ),
              CustomContainerProfile(
                text: AppStrings.preferredBanks,
                stringIcon: AppAssetIcons.bank,
                onTap: () {
                  controller.goToPreferredOfBanks();
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomContainerProfile(
                text: AppStrings.preferredCurrencies,
                stringIcon: AppAssetIcons.dollar,
                onTap: () {
                  controller.goToPreferredOfCurrencies();
                },
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
            ],
          ),
        ),
      ),
    );
  }
}
