import 'dart:developer';

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
          child: ListView(
            padding: EdgeInsets.all(context.screenWidth * 0.01),
            children: [
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              CustomTextField(
                controller: controller.nameController,
                label: AppStrings.fullName,
                hint: AppStrings.insertFullName,
                icon: Image.asset(AppAssetIcons.profile),
                textInputType: TextInputType.name,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Username is required";
                  } else if (text.length > 20) {
                    return "Username must be less than 20 char";
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
                controller: controller.emailController,
                label: AppStrings.email,
                hint: AppStrings.insertEmail,
                icon: Image.asset(
                  AppAssetIcons.message,
                ),
                textInputType: TextInputType.emailAddress,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Email is required";
                  } else if (text.length < 8) {
                    return "Email must be longer than 20 char";
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
                controller: controller.passwordController,
                label: AppStrings.password,
                hint: AppStrings.insertPassword,
                icon: Image.asset(AppAssetIcons.lock),
                textInputType: TextInputType.visiblePassword,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Password is required";
                  } else if (text.length < 8) {
                    return "Password must be longer than 8 char";
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
                controller: controller.passwordConfirmationController,
                label: AppStrings.confirmPassword,
                hint: AppStrings.insertPassword,
                icon: Image.asset(AppAssetIcons.lock),
                textInputType: TextInputType.visiblePassword,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Password is required";
                  } else if (text.length < 8) {
                    return "Password must be longer than 8 char";
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
              GetBuilder<RegisterController>(
                  id: "TextError",
                  builder: (_) {
                    return Center(
                        child: Text(controller.error ?? "",
                            style: TextStyle(
                                color: AppColors.red,
                                fontSize: 16 * context.textScale)));
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(context.screenWidth * 0.06),
        color: AppColors.blackNormalHover,
        child: GetBuilder<RegisterController>(
          id: "ElevatedButton",
          builder: (_) {
            return StateButton(
              textColor: AppColors.blackDark,
              text: AppStrings.complete,
              buttonColor: AppColors.yellowNormal,
              radius: 14,
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
