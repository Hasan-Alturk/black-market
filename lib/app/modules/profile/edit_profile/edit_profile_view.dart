import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/core/widgets/custom_edit_text_field_.dart';
import 'package:black_market/app/core/widgets/state_button.dart';
import 'package:black_market/app/modules/profile/edit_profile/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: AppStrings.editProfile,
        onTap: () => controller.goToHome(),
      ),
      backgroundColor: AppColors.blackNormalHover,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(context.screenWidth * 0.01),
          children: [
            Column(
              children: [
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
                  AppStrings.changePhoto,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.green,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * 0.05,
                ),
                CustomEditTextField(
                  text: AppStrings.userName,
                  label: AppStrings.fullName,
                  icon: Image.asset(AppAssetIcons.profileGold),
                  textInputType: TextInputType.name,
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                CustomEditTextField(
                  text: AppStrings.emailFake,
                  label: AppStrings.email,
                  icon: Image.asset(
                    AppAssetIcons.messageGold,
                  ),
                  textInputType: TextInputType.emailAddress,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(context.screenWidth * 0.06),
        color: AppColors.blackNormalHover,
        child: StateButton(
          isLoading: false,
          text: AppStrings.change,
          onPressed: () => (),
          buttonColor: AppColors.yellowNormal,
          radius: 14,
        ),
      ),
    );
  }
}
