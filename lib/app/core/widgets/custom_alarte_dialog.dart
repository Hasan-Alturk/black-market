import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/state_button.dart';
import 'package:flutter/material.dart';

class CustomAlarteDialog extends StatelessWidget {
  final String text;
  final String contentButton;
  final Function() onPressed;
  final Function() onTap;

  const CustomAlarteDialog({
    super.key,
    required this.contentButton,
    required this.onPressed,
    required this.onTap,
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
          height: context.screenHeight * 0.4,
          width: context.screenWidth,
          child: Padding(
            padding: EdgeInsets.all(context.screenWidth * 0.07),
            child: Column(
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(AppAssetIcons.close),
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                  child: Text(text),
                ),
                SizedBox(
                  height: context.screenHeight * 0.03,
                ),
                CircleAvatar(
                  radius: 45.0,
                  backgroundColor: AppColors.red,
                  child: Image.asset(AppAssetIcons.wrong),
                ),
                SizedBox(
                  height: context.screenHeight * 0.03,
                ),
                StateButton(
                    textColor: AppColors.white,
                    isLoading: false,
                    text: contentButton,
                    onPressed: () => (),
                    buttonColor: AppColors.red,
                    radius: 14)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
