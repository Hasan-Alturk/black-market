import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text, required this.onTap});
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
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
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(flex: 2),
        Expanded(
          flex: 1,
          child: GestureDetector(
              onTap: onTap, child: Image.asset(AppAssetIcons.back)),
        )
      ],
    );
  }
}
