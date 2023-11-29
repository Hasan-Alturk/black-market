import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/custom_alarte_dialog.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/core/widgets/custom_container_profile.dart';
import 'package:black_market/app/modules/profile/setting/main_setting/main_profile_controller.dart';
import 'package:flutter/material.dart';
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
        child: ListView(
          padding: EdgeInsets.all(context.screenWidth * 0.01),
          children: [
            Column(
              children: [
                SizedBox(
                  height: context.screenHeight * 0.06,
                ),
                CustomContainerProfile(
                  text: AppStrings.changePassword,
                  stringIcon: AppAssetIcons.lock,
                  onTap: () => controller.goToChangePassword(),
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                CustomContainerProfile(
                  text: AppStrings.preferredBanks,
                  stringIcon: AppAssetIcons.bank,
                  onTap: () {},
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                CustomContainerProfile(
                  text: AppStrings.preferredCurrencies,
                  stringIcon: AppAssetIcons.dollar,
                  onTap: () {},
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                CustomContainerProfile(
                  text: AppStrings.language,
                  stringIcon: AppAssetIcons.global,
                  onTap: () {
                    controller.goToLanguage();
                  },
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                CustomContainerProfile(
                  text: AppStrings.notificationsSetting,
                  stringIcon: AppAssetIcons.note,
                  onTap: () {
                    controller.goToNotificationsSetting();
                  },
                ),
                SizedBox(
                  height: context.screenHeight * 0.05,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomAlarteDialog(
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
                          fontSize: 14 * context.textScale,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: context.screenWidth * 0.02,
                      ),
                      Image.asset(
                        AppAssetIcons.delete,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
