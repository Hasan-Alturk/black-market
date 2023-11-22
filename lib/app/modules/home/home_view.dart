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
          Container(
            decoration: BoxDecoration(
                color: AppColors.gray,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32))),
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
                                    color: AppColors.blackLight,
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
                        AppStrings.blackMarket,
                        style: TextStyle(
                            fontSize: 28,
                            color: AppColors.yellowNormal,
                            fontWeight: FontWeight.bold),
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
                        height: context.screenHeight * 0.1,
                        width: context.screenWidth * 0.5,
                        decoration: BoxDecoration(
                            color: AppColors.yellowLight,
                            borderRadius: BorderRadius.circular(24)),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
