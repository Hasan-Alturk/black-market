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
  ResetPasswordView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormalHover,
      appBar: CustomAppBar(
        text: AppStrings.createNewPassword,
        onTap: () => Get.back(),
      ),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(context.screenWidth * 0.01),
            children: [
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              CustomTextField(
                controller: controller.passwordController,
                label: AppStrings.password,
                hint: AppStrings.insertPassword,
                icon: Image.asset(AppAssetIcons.lock),
                textInputType: TextInputType.visiblePassword,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return AppStrings.passwordRequired;
                  } else if (text.length < 8) {
                    return AppStrings.characterCountRequirementPassword;
                  } else if (!RegExp(
                          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%^&*()]).{8,}$')
                      .hasMatch(text)) {
                    return AppStrings.conditionPassword;
                  } else {
                    return null;
                  }
                },
                onChanged: (_) {
                  if (isChanged) {
                    formKey.currentState!.validate();
                  }
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              CustomTextField(
                controller: controller.confirmPasswordController,
                label: AppStrings.confirmPassword,
                hint: AppStrings.insertPassword,
                icon: Image.asset(AppAssetIcons.lock),
                textInputType: TextInputType.visiblePassword,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return AppStrings.passwordRequired;
                  } else if (text.length < 8) {
                    return AppStrings.characterCountRequirementPassword;
                  } else if (!RegExp(
                          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%^&*()]).{8,}$')
                      .hasMatch(text)) {
                    return AppStrings.conditionPassword;
                  } else {
                    return null;
                  }
                },
                onChanged: (_) {
                  if (isChanged) {
                    formKey.currentState!.validate();
                  }
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.1,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(context.screenWidth * 0.06),
        color: AppColors.blackNormalHover,
        child: GetBuilder<ResetPasswordController>(
            id: "goToNewPasswordSuccessfully",
            builder: (_) {
              return StateButton(
                textColor: AppColors.blackDark,
                isLoading: controller.isLoading,
                text: AppStrings.complete,
                onPressed: () => controller.goToNewPasswordSuccessfully(),
                buttonColor: AppColors.yellowNormal,
                radius: 14,
              );
            }),
      ),
    );
  }
}
