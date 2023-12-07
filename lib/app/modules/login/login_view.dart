import 'dart:developer';

import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/custom_text_field.dart';
import 'package:black_market/app/core/widgets/state_button.dart';
import 'package:black_market/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormalHover,
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 120.h,
              ),
              SizedBox(
                height: 78.h,
                width: 252.w,
                child: Text(
                  AppStrings.loginIntoAccount,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: controller.emailController,
                        label: AppStrings.email,
                        hint: AppStrings.insertEmail,
                        icon: Image.asset(AppAssetIcons.message),
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
                        height: 24.h,
                      ),
                      CustomTextField(
                        controller: controller.passwordController,
                        label: AppStrings.password,
                        hint: AppStrings.insertPassword,
                        icon: Image.asset(AppAssetIcons.lock),
                        textInputType: TextInputType.emailAddress,
                        obscureText: false,
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
                        height: 21.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => controller.goToSendOtp(),
                            child: Text(
                              AppStrings.didYouForgetPassword,
                              style: TextStyle(
                                fontSize: 12 * context.textScale,
                                color: AppColors.yellowLightActive,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                AppStrings.remember,
                                style: TextStyle(
                                  fontSize: 14 * context.textScale,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Obx(
                                () => Radio<bool>(
                                  value: true,
                                  groupValue: controller.rememberMe.value,
                                  onChanged: (value) {
                                    controller.rememberMe.value = value!;
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) {
                                      if (states.contains(
                                              MaterialState.disabled) ||
                                          !controller.rememberMe.value) {
                                        return AppColors.white;
                                      }
                                      return AppColors.yellowDark;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      GetBuilder<LoginController>(
                          id: "ElevatedButton",
                          builder: (_) {
                            return StateButton(
                              textColor: AppColors.blackDark,
                              isLoading: controller.isLoading,
                              text: AppStrings.login,
                              buttonColor: AppColors.yellowNormal,
                              radius: 14,
                              // onPressed: () {
                              //   controller.goToHome();
                              // },
                              onPressed: () {
                                isChanged = true;
                                if (formKey.currentState!.validate()) {
                                  controller.login();
                                } else {
                                  log("Error From validate");
                                }
                              },
                            );
                          }),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => controller.goToRegister(),
                            child: Text(
                              AppStrings.createAccount,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.yellowLightActive,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            AppStrings.dontHaveAnAccount,
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.graylight,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      GetBuilder<LoginController>(
                        id: "TextError",
                        builder: (_) {
                          return Center(
                            child: Text(
                              controller.error ?? "",
                              style: TextStyle(
                                  color: AppColors.red,
                                  fontSize: 16 * context.textScale),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
