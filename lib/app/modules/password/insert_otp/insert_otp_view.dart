import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/modules/password/insert_otp/insert_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

class InsertOtpView extends GetView<InsertOtpController> {
  const InsertOtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String otp;
    return Scaffold(
      backgroundColor: AppColors.blackNormalHover,
      appBar: CustomAppBar(
        text: AppStrings.resetPassword,
        onTap: () => Get.back(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.insertOtp,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  AppStrings.weSendOtp,
                  style: TextStyle(
                    color: AppColors.yellowLightHover,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  controller.email,
                  style: TextStyle(
                    color: AppColors.yellowNormal,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            SingleChildScrollView(
              child: OtpTextField(
                fieldWidth: 65.w,
                numberOfFields: 4,
                showFieldAsBox: true,
                margin: EdgeInsets.all(12.w),
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                borderWidth: 0,
                enabledBorderColor: AppColors.gray,
                filled: true,
                cursorColor: AppColors.yellowDarker,
                focusedBorderColor: AppColors.yellowNormal,
                borderColor: AppColors.yellowLight,
                textStyle: TextStyle(
                  color: AppColors.blackLightHover,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
                fillColor: AppColors.gray,

                //runs when every textfield is filled
                onSubmit: (String code) {
                  otp = code;
                  controller.goToResetPassword(otp);
                },
              ),
            ),
            SizedBox(
              height: 43.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GetBuilder<InsertOtpController>(
                    id: "ReSendOtp",
                    builder: (_) {
                      return OtpTimerButton(
                        backgroundColor: AppColors.gray,
                        height: 48.h,
                        onPressed: () {
                          controller.reSendOtp();
                        },
                        text: Text(
                          AppStrings.reSendOtp,
                          style: TextStyle(
                            color: AppColors.yellowNormal,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        duration: 30,
                      );
                    }),
                Text(
                  AppStrings.dontReciveOtp,
                  style: TextStyle(
                    color: AppColors.lighterGrey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
