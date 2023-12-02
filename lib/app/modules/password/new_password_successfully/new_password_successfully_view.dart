import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/widgets/state_button.dart';
import 'package:black_market/app/modules/password/new_password_successfully/new_password_successfully_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewPasswordSuccessfullyView
    extends GetView<NewPasswordSuccessfullyController> {
  const NewPasswordSuccessfullyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormalHover,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(AppAssetImage.completeResetPassword)),
            SizedBox(
              height: 50.h,
            ),
            Text(
              AppStrings.newPasswordSuccessfully,
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.yellowNormal,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 24.h),
        color: AppColors.blackNormalHover,
        child: GetBuilder<NewPasswordSuccessfullyController>(
            id: "login",
            builder: (_) {
              return StateButton(
                textColor: AppColors.blackDark,
                isLoading: controller.isLoading,
                text: AppStrings.main,
                onPressed: () => controller.login(),
                buttonColor: AppColors.yellowNormal,
                radius: 14.r,
              );
            }),
      ),
    );
  }
}
