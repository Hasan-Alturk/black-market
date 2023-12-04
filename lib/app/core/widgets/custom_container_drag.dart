import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerDrag extends StatelessWidget {
  const CustomContainerDrag(
      {super.key,
      required this.text,
      required this.stringIcon,
      required this.stringImage});
  final String text;
  final String stringIcon;
  final String stringImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.gray,
        border: Border.all(color: AppColors.gray),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Image.asset(stringIcon)),
          Flexible(
            flex: 6,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                text,
                style: TextStyle(
                  color: AppColors.whiteLight,
                  fontSize: 14 * context.textScale,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Flexible(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.network(
                BaseUrls.storageUrl + stringImage,
                width: 30.w,
                height: 30.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
