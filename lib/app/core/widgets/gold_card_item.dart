// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:flutter/material.dart';

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
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(context.screenWidth * 0.001),
        child: Column(
          children: [
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.screenWidth * 0.03,
                ),
                Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.darkGrey),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(context.screenHeight * 0.006),
                      child: Icon(
                        Icons.share,
                        size: 15,
                        color: AppColors.whiteActive,
                      ),
                    )),
                SizedBox(
                  width: context.screenWidth * 0.065,
                ),
                Center(
                  child: CircleAvatar(
                    backgroundColor: AppColors.darkGrey,
                    radius: 25,
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
      ),
    );
  }
}
