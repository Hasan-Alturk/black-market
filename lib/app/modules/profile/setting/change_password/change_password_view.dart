import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/custom_alarte_dialog_password.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/core/widgets/custom_text_field.dart';
import 'package:black_market/app/core/widgets/state_button.dart';
import 'package:black_market/app/modules/profile/setting/change_password/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);

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
          padding: EdgeInsets.all(context.screenWidth * 0.03),
          children: [
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
            CustomTextField(
              label: AppStrings.nowPassword,
              hint: AppStrings.insertPassword,
              icon: Image.asset(AppAssetIcons.lock),
            ),
            SizedBox(
              height: context.screenHeight * 0.04,
            ),
            CustomTextField(
              label: AppStrings.newPassword,
              hint: AppStrings.insertPassword,
              icon: Image.asset(AppAssetIcons.lock),
            ),
            SizedBox(
              height: context.screenHeight * 0.04,
            ),
            CustomTextField(
              label: AppStrings.confirmPasswordNew,
              hint: AppStrings.insertPassword,
              icon: Image.asset(AppAssetIcons.lock),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(context.screenWidth * 0.06),
        color: AppColors.blackNormalHover,
        child: StateButton(
          textColor: AppColors.blackDark,
          isLoading: false,
          text: AppStrings.changePassword,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomAlarteDialogPassword(
                  text: AppStrings.aboutApp,
                  contentButton: AppStrings.main,
                  onPressed: () => controller.goToMainHome(),
                );
              },
            );
          },
          buttonColor: AppColors.yellowNormal,
          radius: 14,
        ),
      ),
    );
  }
}
