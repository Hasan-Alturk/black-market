import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpalshView extends StatefulWidget {
  const SpalshView({super.key});

  @override
  State<SpalshView> createState() => _SpalshViewState();
}

class _SpalshViewState extends State<SpalshView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        checkToken();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowNormal,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: context.screenHeight * 0.2,
            ),
            Image.asset(
              AppAssetImage.imageOnBoarding,
            ),
          ],
        ),
      ),
    );
  }
}
void checkToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  bool? rememberMe = prefs.getBool("rememberMe");
// ||
  if (token != null && token.isNotEmpty && rememberMe == true) {
    Get.offAllNamed("/main_home");
  } else {
    Get.offAllNamed("/login");
  }
}
