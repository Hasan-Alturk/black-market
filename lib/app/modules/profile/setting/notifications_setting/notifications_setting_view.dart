import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/modules/profile/setting/notifications_setting/notifications_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsSettingView extends GetView<NotificationsSettingController> {
  const NotificationsSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormalHover,
      appBar: CustomAppBar(
        text: AppStrings.notificationsSetting,
        onTap: () => controller.goToMainSetting(),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(context.screenWidth * 0.03),
          children: [
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
            Switch(
              value: false,
              onChanged: (value) => controller.isSwitched,
            )
          ],
        ),
      ),
    );
  }
}
