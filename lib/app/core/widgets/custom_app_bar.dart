import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(flex: 3),
        Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Spacer(flex: 2),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.gray,
            border: Border.all(color: AppColors.gray),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(AppAssetIcons.arrowLeft),
        ),
      ],
    );
  }
}
