import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  CustomSwitch({
    super.key,
    required this.text,
    required this.isSwitched,
    required this.onChanged,
  });

  final String text;
  final bool isSwitched;
  void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(context.screenWidth * 0.05),
          height: context.screenHeight * 0.08,
          decoration: BoxDecoration(
            color: AppColors.gray,
            border: Border.all(color: AppColors.gray),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Switch(
                  activeTrackColor: AppColors.greenLight,
                  activeColor: AppColors.white,
                  value: isSwitched,
                  onChanged: onChanged),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  text,
                  style: TextStyle(
                    color: AppColors.whiteLight,
                    fontSize: 14 * context.textScale,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
