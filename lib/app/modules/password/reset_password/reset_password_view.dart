import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/core/widgets/custom_text_field.dart';
import 'package:black_market/app/core/widgets/state_button.dart';
import 'package:black_market/app/modules/password/reset_password/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormalHover,
      appBar: CustomAppBar(
        text: AppStrings.createNewPassword,
        onTap: () => Get.back(),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(context.screenWidth * 0.01),
          children: [
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
            CustomTextField(
              label: AppStrings.password,
              hint: AppStrings.insertPassword,
              icon: Image.asset(AppAssetIcons.lock),
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            CustomTextField(
              label: AppStrings.confirmPassword,
              hint: AppStrings.insertPassword,
              icon: Image.asset(AppAssetIcons.lock),
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: context.screenHeight * 0.1,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(context.screenWidth * 0.06),
        color: AppColors.blackNormalHover,
        child: StateButton(
          textColor: AppColors.blackDark,
          isLoading: false,
          text: AppStrings.complete,
          onPressed: () => controller.goToNewPasswordSuccessfully(),
          buttonColor: AppColors.yellowNormal,
          radius: 14,
        ),
      ),
    );
  }
}
