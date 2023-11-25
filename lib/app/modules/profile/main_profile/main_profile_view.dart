import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/modules/profile/main_profile/main_profile_successfully_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainProfileView extends GetView<MainProfileController> {
  const MainProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.gray,
        body: const Center(
          child: Text("porfile"),
        ));
  }
}
