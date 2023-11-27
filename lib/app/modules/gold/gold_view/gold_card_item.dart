import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:flutter/material.dart';

class GoldCardItem extends StatelessWidget {
  const GoldCardItem({super.key});

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
            height: context.screenHeight * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.blackDark),
                ),
                child: CircleAvatar(
                  backgroundColor: AppColors.darkGrey,
                  radius: 15,
                  child: Image.asset(AppAssetIcons.share),
                ),
              ),
              Center(
                child: CircleAvatar(
                  backgroundColor: AppColors.darkGrey,
                  radius: 25,
                  child: Image.asset(AppAssetImage.bankMasr),
                ),
              ),
            ],
          ),
          Text(
            "بنك مصر ",
            style: TextStyle(color: AppColors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.sell,
                      style: TextStyle(color: AppColors.white),
                    ),
                    Text(
                      "31.25 ج.م ",
                      style: TextStyle(
                          color: AppColors.white, fontWeight: FontWeight.w700),
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
                      style: TextStyle(color: AppColors.white),
                    ),
                    Text(
                      "30.25 ج.م ",
                      style: TextStyle(
                          color: AppColors.white, fontWeight: FontWeight.w700),
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
