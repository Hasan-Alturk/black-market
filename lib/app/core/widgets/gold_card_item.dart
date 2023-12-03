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
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 14.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.darkGrey),
                ),
                margin: EdgeInsets.only(
                  left: 9.6.w,
                ),
                child: Padding(
                  padding: EdgeInsets.all(5.w),
                  child: Icon(
                    Icons.share,
                    size: 15.w,
                    color: AppColors.whiteActive,
                  ),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Center(
                child: CircleAvatar(
                  backgroundColor: AppColors.darkGrey,
                  radius: 25.r,
                  child: Image.network(BaseUrls.storageUrl + goldImage),
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.screenHeight * 0.015,
          ),
          Text(
            goldName,
            style: TextStyle(
                color: AppColors.white,
                fontSize: 12 * context.textScale,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: context.screenHeight * 0.001,
          ),
          Padding(
            padding: EdgeInsets.all(context.screenHeight * 0.005),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.sell,
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 9 * context.textScale,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.008,
                    ),
                    Text(
                      price,
                      style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 9 * context.textScale),
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
                          fontWeight: FontWeight.w700,
                          fontSize: 9 * context.textScale),
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.008,
                    ),
                    Text(
                      buyPrice,
                      style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 9 * context.textScale),
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
