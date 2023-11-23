import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.darkGrey, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: context.screenHeight * 0.02,
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
                  child: Image.asset(AppAssetIcons.heart),
                  radius: 15,
                ),
              ),
              CircleAvatar(
                child: Image.asset(AppAssetIcons.heart),
              ),
              CircleAvatar(
                child: Image.asset(AppAssetIcons.heart),
              )
            ],
          )
        ],
      ),
    );
  }
}
