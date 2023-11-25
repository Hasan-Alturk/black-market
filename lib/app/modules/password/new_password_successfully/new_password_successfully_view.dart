import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/state_button.dart';
import 'package:black_market/app/modules/password/new_password_successfully/new_password_successfully_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordSuccessfullyView
    extends GetView<NewPasswordSuccessfullyController> {
  const NewPasswordSuccessfullyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormalHover,
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssetImage.completeResetPassword),
            SizedBox(
              height: context.screenHeight * 0.07,
            ),
            Text(
              AppStrings.newPasswordSuccessfully,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.yellowNormal,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        )),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(context.screenWidth * 0.06),
        color: AppColors.blackNormalHover,
        child: StateButton(
          isLoading: false,
          text: AppStrings.main,
          onPressed: () => controller.goToHmoe(),
          buttonColor: AppColors.yellowNormal,
          radius: 14,
        ),
      ),
    );
  }
}