import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/widgets/state_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAlarteDialog extends StatelessWidget {
  final String text;
  final String contentButton;
  final bool isLoading;

  final Function() onPressed;
  final Function() onTap;

  const CustomAlarteDialog({
    super.key,
    required this.contentButton,
    required this.onPressed,
    required this.onTap,
    required this.text,
    required this.isLoading,
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
          height: 375.h,
          width: 375.w,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(23.w, 28.h, 315.w, 0),
                child: GestureDetector(
                  onTap: onTap,
                  child: Image.asset(AppAssetIcons.redClose),
                ),
              ),
              SizedBox(
                height: 23.h,
              ),
              DefaultTextStyle(
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                ),
                textAlign: TextAlign.center,
                child: Text(text),
              ),
              SizedBox(
                height: 31.h,
              ),
              CircleAvatar(
                radius: 45.0.r,
                backgroundColor: AppColors.red,
                child: Image.asset(AppAssetIcons.wrong),
              ),
              SizedBox(
                height: 32.h,
              ),
              SizedBox(
                width: 180.w,
                child: StateButton(
                  textColor: AppColors.white,
                  isLoading: isLoading,
                  text: contentButton,
                  onPressed: onPressed,
                  buttonColor: AppColors.red,
                  radius: 14.r,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
