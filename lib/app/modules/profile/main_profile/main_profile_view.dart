import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/custom_alarte_dialog.dart';
import 'package:black_market/app/core/widgets/custom_container_profile.dart';
import 'package:black_market/app/modules/profile/main_profile/main_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainProfileView extends GetView<MainProfileController> {
  const MainProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormalHover,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(context.screenWidth * 0.01),
          children: [
            Column(
              children: [
                SizedBox(
                  height: context.screenHeight * 0.01,
                ),
                Center(
                  child: Text(
                    AppStrings.profile,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * 0.05,
                ),
                const CircleAvatar(
                  radius: 41.0,
                  backgroundImage: AssetImage(AppAssetImage.avatar),
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                Text(
                  AppStrings.userName,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.yellowNormal,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * 0.05,
                ),
                CustomContainerProfile(
                  text: AppStrings.editProfile,
                  stringIcon: AppAssetIcons.profile,
                  onTap: () => controller.goToEditProfile(),
                ),
                SizedBox(
                  height: context.screenHeight * 0.01,
                ),
                CustomContainerProfile(
                  text: AppStrings.shareTheApp,
                  stringIcon: AppAssetIcons.share,
                  onTap: () {},
                ),
                SizedBox(
                  height: context.screenHeight * 0.01,
                ),
                CustomContainerProfile(
                  text: AppStrings.aboutApp,
                  stringIcon: AppAssetIcons.info,
                  onTap: () {},
                ),
                SizedBox(
                  height: context.screenHeight * 0.01,
                ),
                CustomContainerProfile(
                  text: AppStrings.mainCurrency,
                  stringIcon: AppAssetIcons.dollar,
                  onTap: () {},
                ),
                SizedBox(
                  height: context.screenHeight * 0.01,
                ),
                CustomContainerProfile(
                  text: AppStrings.setting,
                  stringIcon: AppAssetIcons.setting,
                  onTap: () {},
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
                          onTap: Get.back,
                          content: "content",
                          onPressed: () => (),
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
                          fontSize: 14 * context.textScale,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: context.screenWidth * 0.02,
                      ),
                      Image.asset(
                        AppAssetIcons.logout,
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
