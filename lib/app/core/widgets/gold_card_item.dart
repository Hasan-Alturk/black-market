// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldCardItem extends StatelessWidget {
  final String goldName;
  final String buyPrice;
  final String price;
  final String goldImage;
  const GoldCardItem({
    Key? key,
    required this.goldName,
    required this.buyPrice,
    required this.price,
    required this.goldImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.w,
      height: 135.h,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          width: 0.5.w,
          color: AppColors.darkGrey,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 14.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 25.w,
                height: 25.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.darkGrey),
                ),
                child: Icon(
                  Icons.share,
                  size: 12.sp,
                  color: AppColors.whiteActive,
                ),
              ),
              SizedBox(
                height: 46.h,
                width: 46.w,
                child: CircleAvatar(
                  backgroundColor: AppColors.darkGrey,
                  child: Image.network(BaseUrls.storageUrl + goldImage),
                ),
              ),
              Container(
                width: 25.5.w,
                height: 25.5.h,
                color: AppColors.gray,
              ),
            ],
          ),
          SizedBox(
            height: 9.h,
          ),
          Text(
            goldName,
            style: TextStyle(
                color: AppColors.white,
                fontSize: 12 * context.textScale,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 9.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.sell,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    price,
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 9.sp),
                  )
                ],
              ),
              Container(
                height: 18.h,
                width: 1.w,
                color: AppColors.darkGrey,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.buy,
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 9.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    buyPrice,
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 9.sp),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
