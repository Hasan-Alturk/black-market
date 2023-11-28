import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:flutter/material.dart';

class GoldCalculatorDialog extends StatelessWidget {
  const GoldCalculatorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: context.screenHeight * 0.35,
        width: context.screenWidth * 0.92,
        decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    backgroundColor: AppColors.darkGrey,
                    child: Image.asset(AppAssetIcons.close),
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * 0.015,
                ),
                Card(
                  elevation: 0,
                  color: AppColors.gray,
                  child: TextField(
                    cursorColor: AppColors.yellowNormal,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.darkGrey),
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyNormal),
                            borderRadius: BorderRadius.circular(12)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyNormal),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: AppStrings.totalPaidAmount,
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.greyNormalActive)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: context.screenWidth * 0.4,
                      child: Card(
                        elevation: 0,
                        color: AppColors.gray,
                        child: TextField(
                          cursorColor: AppColors.greyNormalActive,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.darkGrey),
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              prefixIcon: Image.asset(
                                AppAssetIcons.arrowDown,
                                scale: 0.7,
                                color: AppColors.white,
                              ),
                              prefixIconColor: AppColors.white,
                              contentPadding: const EdgeInsets.all(12),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.greyNormal),
                                  borderRadius: BorderRadius.circular(12)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.greyNormal),
                                  borderRadius: BorderRadius.circular(12)),
                              hintText: AppStrings.caliber,
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: AppColors.greyNormalActive)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.screenWidth * 0.45,
                      child: Card(
                        elevation: 0,
                        color: AppColors.gray,
                        child: TextField(
                          cursorColor: AppColors.yellowNormal,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.darkGrey),
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(12),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.greyNormal),
                                  borderRadius: BorderRadius.circular(12)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.greyNormal),
                                  borderRadius: BorderRadius.circular(12)),
                              hintText: AppStrings.totalWeightInGram,
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: AppColors.greyNormalActive)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.yellowNormal),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      AppStrings.calculateGoldManufacturing,
                      style: TextStyle(
                          color: AppColors.blackNormal,
                          fontWeight: FontWeight.w700),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
