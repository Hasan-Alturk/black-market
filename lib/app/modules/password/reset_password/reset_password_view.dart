import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/core/widgets/custom_text_field.dart';
import 'package:black_market/app/core/widgets/state_button.dart';
import 'package:black_market/app/modules/password/reset_password/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                SizedBox(
                  height: 60.h,
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
                  height: 32.h,
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 24.h),
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
                radius: 14.r,
              );
            }),
      ),
    );
  }
}
