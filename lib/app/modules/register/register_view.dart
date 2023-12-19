import 'dart:developer';

import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/core/widgets/custom_text_field.dart';
import 'package:black_market/app/core/widgets/state_button.dart';
import 'package:black_market/app/modules/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormalHover,
      appBar: CustomAppBar(
        text: AppStrings.createAccountNew,
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
                  height: 64.h,
                ),
                CustomTextField(
                  controller: controller.nameController,
                  label: AppStrings.fullName,
                  hint: AppStrings.insertFullName,
                  icon: Image.asset(AppAssetIcons.profile),
                  textInputType: TextInputType.name,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return AppStrings.userNameRequired;
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
                  height: 26.h,
                ),
                CustomTextField(
                  controller: controller.emailController,
                  label: AppStrings.email,
                  hint: AppStrings.insertEmail,
                  icon: Image.asset(
                    AppAssetIcons.message,
                  ),
                  textInputType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return AppStrings.emailRequired;
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
                  height: 26.h,
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
                  height: 26.h,
                ),
                CustomTextField(
                  controller: controller.passwordConfirmationController,
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
                  height: 26.h,
                ),
                GetBuilder<RegisterController>(
                  id: "TextError",
                  builder: (_) {
                    return Center(
                      child: Text(
                        controller.error ?? "",
                        style: TextStyle(color: AppColors.red, fontSize: 16.sp),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 26.h,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 24.h),
        child: GetBuilder<RegisterController>(
          id: "ElevatedButton",
          builder: (_) {
            return StateButton(
              textColor: AppColors.blackDark,
              text: AppStrings.complete,
              buttonColor: AppColors.yellowNormal,
              radius: 14.r,
              isLoading: controller.isLoading,
              onPressed: () {
                isChanged = true;
                if (formKey.currentState!.validate()) {
                  controller.register();
                } else {
                  log("Error From validate");
                }
              },
            );
          },
        ),
      ),
    );
  }
}
