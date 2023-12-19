import 'dart:developer';

import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/core/widgets/custom_text_field.dart';
import 'package:black_market/app/core/widgets/state_button.dart';
import 'package:black_market/app/modules/password/send_otp/send_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
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
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                height: 80.h,
                width: 340.w,
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  border: Border.all(color: AppColors.gray),
                  borderRadius: BorderRadius.circular(8.r),
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
                            wordSpacing: 1.w,
                            height: 2.h,
                            fontSize: 12.sp,
                            color: AppColors.yellowLightHover,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Image.asset(AppAssetIcons.note),
                  ],
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 12.w,
                    right: 12.w,
                  ),
                  child: CustomTextField(
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
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 24.h),
        color: AppColors.blackNormalHover,
        child: GetBuilder<SendOtpController>(
          id: "ElevatedButton",
          builder: (_) {
            return StateButton(
              textColor: AppColors.blackDark,
              isLoading: controller.isLoading,
              text: AppStrings.complete,
              buttonColor: AppColors.yellowNormal,
              radius: 14.r,
              onPressed: () {
                isChanged = true;
                if (formKey.currentState!.validate()) {
                  controller.goToInsertOtp(controller.emailController.text);
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
