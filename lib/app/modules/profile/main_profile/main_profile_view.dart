import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/modules/profile/main_profile/main_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainProfileView extends GetView<MainProfileController> {
  const MainProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            AppStrings.profile,
            style: TextStyle(
              fontSize: 18,
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        backgroundColor: AppColors.blackNormalHover,
      ),
      backgroundColor: AppColors.blackNormalHover,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
