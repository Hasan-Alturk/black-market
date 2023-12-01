import 'dart:developer';

import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/core/widgets/custom_text_field.dart';
import 'package:black_market/app/core/widgets/state_button.dart';
import 'package:black_market/app/modules/password/send_otp/send_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendOtpView extends GetView<SendOtpController> {
  SendOtpView({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormalHover,
      appBar: CustomAppBar(
        text: AppStrings.resetPassword,
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
              SizedBox(
                height: context.screenHeight * 0.04,
              ),
              Container(
                padding: EdgeInsets.all(context.screenWidth * 0.05),
                height: context.screenHeight * 0.1,
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  border: Border.all(color: AppColors.gray),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          AppStrings.otp,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.yellowLightHover,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.screenHeight * 0.02,
                    ),
                    Image.asset(AppAssetIcons.note),
                  ],
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(context.screenWidth * 0.06),
        color: AppColors.blackNormalHover,
        child: GetBuilder<SendOtpController>(
          id: "ElevatedButton",
          builder: (_) {
            return StateButton(
              textColor: AppColors.blackDark,
              isLoading: controller.isLoading,
              text: AppStrings.complete,
              onPressed: () {
                isChanged = true;
                if (formKey.currentState!.validate()) {
                  controller.goToInsertOtp();
                } else {
                  log("Error From validate");
                }
              },
              buttonColor: AppColors.yellowNormal,
              radius: 14,
            );
          },
        ),
      ),
    );
  }
}
