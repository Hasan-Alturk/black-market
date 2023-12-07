import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyItem extends StatelessWidget {
  final String currencyName;
  final String currenyImage;

  const CurrencyItem({
    super.key,
    required this.currencyName,
    required this.currenyImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.gray,
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: AppColors.darkGrey,
            radius: 20.r,
            child: Image.network(BaseUrls.storageUrl + currenyImage)),
        title: Text(
          currencyName,
          style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: 15.sp),
        ),
      ),
    );
  }
}
