import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomContainerNotifications extends StatelessWidget {
  final String title;
  final String body;
  final String notificationDate;

  const CustomContainerNotifications({
    super.key,
    required this.title,
    required this.body,
    required this.notificationDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            DateFormat('yyyy/MM/dd').format(
              DateTime.parse(notificationDate),
            ),
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.yellowDark,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.gray,
            borderRadius: BorderRadius.all(
              Radius.circular(20.r),
            ),
          ),
          width: 350.w,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  body,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.greyWhite,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
