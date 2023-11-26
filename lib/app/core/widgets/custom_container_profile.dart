import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:flutter/material.dart';

class CustomContainerProfile extends StatelessWidget {
  const CustomContainerProfile(
      {super.key,
      required this.text,
      required this.onTap,
      required this.stringIcon});
  final String text;
  final String stringIcon;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.screenWidth * 0.05),
      height: context.screenHeight * 0.08,
      decoration: BoxDecoration(
        color: AppColors.gray,
        border: Border.all(color: AppColors.gray),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Flexible(
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: onTap,
                child: Image.asset(
                  AppAssetIcons.arrowRight,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                text,
                style: TextStyle(
                  color: AppColors.whiteLight,
                  fontSize: 14*context.textScale,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Flexible(
              child: Align(
            alignment: Alignment.centerRight,
            child: Image.asset(stringIcon),
          )),
        ],
      ),
    );
  }
}
