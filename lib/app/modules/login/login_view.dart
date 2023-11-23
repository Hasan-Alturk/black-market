import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/custom_text_field.dart';
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
            padding: const EdgeInsets.all(15),
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
              )
            ],
          ),
        ));
  }
}
