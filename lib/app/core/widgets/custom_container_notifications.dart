import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomContainerNotifications extends StatelessWidget {
  final String title;
  final String body;
  final DateTime notificationDate;

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
              DateTime(2023, 12, 05, 16, 00, 00),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "الدينار الكويتي والريال العماني أعلي العملات سعرا أمام الجنيه المصري",
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
                  "سجل سعر الريال العماني في السوق السوداء اليوم سعر 120 جنيه للشراء، وسعر 125 جنيه للبيع فيما سجل الدينار الكويتي  سعر 150 جنيه للشراء، وسعر 155 جنيه",
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
