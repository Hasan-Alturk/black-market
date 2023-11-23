import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/custom_text_field.dart';
import 'package:black_market/app/core/widgets/state_button.dart';
import 'package:black_market/app/modules/login/login_contreoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormalHover,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            SizedBox(
              height: context.screenHeight * 0.1,
            ),
            Center(
              child: Text(
                AppStrings.loginIntoAccount,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
            CustomTextField(
              label: AppStrings.email,
              hint: AppStrings.insertEmail,
              icon: Image.asset(AppAssetIcons.message),
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            CustomTextField(
              label: AppStrings.password,
              hint: AppStrings.insertPassword,
              icon: Image.asset(AppAssetIcons.lock),
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.didYouForgetPassword,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.yellowLightActive,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      AppStrings.remember,
                      style: TextStyle(
                        fontSize: 14,
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
                        // activeColor: AppColors.yellowDark,
                        fillColor: MaterialStateColor.resolveWith(
                          (states) {
                            if (states.contains(MaterialState.disabled) ||
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
              height: context.screenHeight * 0.01,
            ),
            StateButton(
              isLoading: false,
              text: "تسجيل الدخول",
              onPressed: () => controller.login(),
              buttonColor: AppColors.yellowNormal,
              radius: 14,
            ),
          ],
        ),
      ),
    );
  }
}
