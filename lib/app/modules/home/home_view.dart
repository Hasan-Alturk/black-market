import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackDarkActive,
      body: SafeArea(
          child: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.gray,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.elliptical(120, 20),
                        bottomRight: Radius.elliptical(120, 20))),
                height: context.screenHeight * 0.35,
                child: Padding(
                  padding: EdgeInsets.all(context.screenWidth * 0.03),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(context.screenWidth * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.blackDarkHover,
                              child: Icon(
                                Icons.notifications_none_outlined,
                                color: AppColors.blackLight,
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      AppStrings.hello,
                                      style: TextStyle(
                                        color: AppColors.blackLightActive,
                                      ),
                                    ),
                                    Text(
                                      AppStrings.nameExample,
                                      style: TextStyle(
                                        color: AppColors.white,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: context.screenWidth * 0.02,
                                ),
                                CircleAvatar(
                                  radius: 24,
                                  child: Image.asset(AppAssetImage.avatar),
                                )
                              ],
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
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: context.screenHeight * 0.12,
                width: context.screenWidth * 0.87,
                decoration: BoxDecoration(
                  color: AppColors.yellowLight,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    // Instead Of Text There is A drop down list
                    Text("دولار امريكى"),
                    SizedBox(
                      height: context.screenHeight * 0.01,
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
                                AppStrings.blackMarket,
                                style: TextStyle(color: AppColors.lightGrey),
                              ),
                              Text(
                                "40 ج.م ",
                                style: TextStyle(color: AppColors.yellowDark),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.lastUpdate,
                                style: TextStyle(color: AppColors.lightGrey),
                              ),
                              Text(
                                "منذ 15 دقيقة",
                                style: TextStyle(
                                    color: AppColors.darkGrey,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.bankPrice,
                                style: TextStyle(color: AppColors.lightGrey),
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
        ],
      )),
    );
  }
}
