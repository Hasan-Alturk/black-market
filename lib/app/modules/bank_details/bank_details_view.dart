import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/modules/bank_details/bank_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankDetailsView extends GetView<BankDetailsController> {
  const BankDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blackDarkActive,
        body: SafeArea(
            child: ListView(children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.gray,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.elliptical(120, 20),
                        bottomRight: Radius.elliptical(120, 20))),
                height: context.screenHeight * 0.4,
                child: Padding(
                    padding: EdgeInsets.all(context.screenWidth * 0.03),
                    child: Padding(
                      padding: EdgeInsets.all(context.screenWidth * 0.03),
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.all(context.screenWidth * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                backgroundColor: AppColors.blackDarkHover,
                                child: Image.asset(
                                  AppAssetIcons.arrowLeft,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: context.screenHeight * 0.02,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.blackMarketInEng,
                              style: TextStyle(
                                  fontSize: 28,
                                  color: AppColors.yellowNormal,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: context.screenHeight * 0.01,
                            ),
                            Text(
                              AppStrings.howMuchInBlackMarket,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.yellowLightActive,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: context.screenHeight * 0.01,
                            ),
                            Container(
                              height: context.screenHeight * 0.15,
                              width: context.screenWidth * 0.87,
                              decoration: BoxDecoration(
                                color: AppColors.yellowLight,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Text(
                                          " البنك المركزى المصرى",
                                        ),
                                        Image.asset(
                                          AppAssetImage.bankMasr,
                                          scale: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: context.screenHeight * 0.01,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppStrings.blackMarket,
                                              style: TextStyle(
                                                  color: AppColors.lightGrey),
                                            ),
                                            Text(
                                              "40 ج.م ",
                                              style: TextStyle(
                                                  color: AppColors.yellowDark),
                                            )
                                          ],
                                        ),
                                        Container(
                                          height: context.screenHeight * 0.04,
                                          width: 1,
                                          color: AppColors.lighterGrey,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppStrings.lastUpdate,
                                              style: TextStyle(
                                                  color: AppColors.lightGrey),
                                            ),
                                            Text(
                                              "منذ 15 دقيقة",
                                              style: TextStyle(
                                                  color: AppColors.darkGrey,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                        Container(
                                          height: context.screenHeight * 0.03,
                                          width: 1,
                                          color: AppColors.lighterGrey,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppStrings.bankPrice,
                                              style: TextStyle(
                                                  color: AppColors.lightGrey),
                                            ),
                                            Text(
                                              "30.25 ج.م ",
                                              style: TextStyle(
                                                  color: AppColors.darkGrey,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ]),
                    )),
              )
            ],
          )
        ])));
  }
}
