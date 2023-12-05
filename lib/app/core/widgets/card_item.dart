import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardItem extends StatelessWidget {
  final String bankName;
  final String bankImage;
  final num sellPrice;
  final num buyPrice;

  const CardItem(
      {super.key,
      required this.bankName,
      required this.bankImage,
      required this.sellPrice,
      required this.buyPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.blackDark),
                ),
                child: CircleAvatar(
                  backgroundColor: AppColors.darkGrey,
                  radius: 15.r,
                  child: Image.asset(AppAssetIcons.heart),
                ),
              ),
              CircleAvatar(
                backgroundColor: AppColors.darkGrey,
                radius: 25.r,
                child: Image.network(BaseUrls.storageUrl + bankImage),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.blackDark),
                ),
                child: CircleAvatar(
                  backgroundColor: AppColors.darkGrey,
                  radius: 15.r,
                  child: Image.asset(AppAssetIcons.share),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            bankName,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.sell,
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "$sellPriceج.م",
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Container(
                  height: context.screenHeight * 0.04,
                  width: 1,
                  color: AppColors.darkGrey,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.buy,
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "$buyPriceج.م",
                      style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 9.sp),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
