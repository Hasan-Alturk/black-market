import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/core/widgets/custom_switch.dart';
import 'package:black_market/app/modules/profile/setting/notifications_setting/notifications_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationsSettingView extends GetView<NotificationsSettingController> {
  const NotificationsSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormalHover,
      appBar: CustomAppBar(
        text: AppStrings.notificationsSetting,
        onTap: () => Get.back(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 25.h),
              Text(
                AppStrings.notifications,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GetX<NotificationsSettingController>(
                builder: (controller) => CustomSwitch(
                  text: AppStrings.coins,
                  isSwitched: controller.isSwitchedCoins.value,
                  onChanged: (value) {
                    controller.isSwitchedCoins.value = value;
                  },
                ),
              ),
              SizedBox(height: 15.h),
              GetX<NotificationsSettingController>(
                builder: (controller) => CustomSwitch(
                  text: AppStrings.gold,
                  isSwitched: controller.isSwitchedGold.value,
                  onChanged: (value) {
                    controller.isSwitchedGold.value = value;
                  },
                ),
              ),
              SizedBox(height: 15.h),
              GetX<NotificationsSettingController>(
                builder: (controller) => CustomSwitch(
                  text: AppStrings.news,
                  isSwitched: controller.isSwitchedNews.value,
                  onChanged: (value) {
                    controller.isSwitchedNews.value = value;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
