import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/state_button.dart';
import 'package:flutter/material.dart';

class CustomAlarteDialogPassword extends StatelessWidget {
  final String text;
  final String contentButton;
  final Function() onPressed;

  const CustomAlarteDialogPassword({
    super.key,
    required this.contentButton,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.elliptical(120, 20),
                  topRight: Radius.elliptical(120, 20))),
          height: context.screenHeight * 0.45,
          width: context.screenWidth,
          child: Padding(
            padding: EdgeInsets.all(context.screenWidth * 0.07),
            child: Column(
              children: [
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                Image.asset(AppAssetImage.completeChangePassword),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    text,
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * 0.05,
                ),
                StateButton(
                    textColor: AppColors.blackNormal,
                    isLoading: false,
                    text: contentButton,
                    onPressed: onPressed,
                    buttonColor: AppColors.yellowNormal,
                    radius: 14)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
