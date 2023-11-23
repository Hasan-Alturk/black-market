import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/core/widgets/custom_text_field.dart';
import 'package:black_market/app/core/widgets/state_button.dart';
import 'package:black_market/app/modules/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormalHover,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(context.screenWidth * 0.01),
          children: [
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
            CustomAppBar(text: AppStrings.createAccountNew),
            SizedBox(
              height: context.screenHeight * 0.04,
            ),
            CustomTextField(
              label: AppStrings.fullName,
              hint: AppStrings.insertFullName,
              icon: Image.asset(AppAssetIcons.profile),
              textInputType: TextInputType.name,
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            CustomTextField(
              label: AppStrings.email,
              hint: AppStrings.insertEmail,
              icon: Image.asset(AppAssetIcons.message),
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
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
            StateButton(
              isLoading: false,
              text: AppStrings.login,
              onPressed: () => controller.register(),
              buttonColor: AppColors.yellowNormal,
              radius: 14,
            ),
          ],
        ),
      ),
    );
  }
}
