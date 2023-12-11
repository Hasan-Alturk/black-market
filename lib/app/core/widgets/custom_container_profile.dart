import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 65.h,
        decoration: BoxDecoration(
          color: AppColors.gray,
          border: Border.all(color: AppColors.gray),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          children: [
            Flexible(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  AppAssetIcons.arrowRight,
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
                    fontSize: 14.sp,
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
      ),
    );
  }
}
