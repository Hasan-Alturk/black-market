import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/widgets/currencies_view_widgets/currencies_container.dart';
import 'package:black_market/app/core/widgets/currencies_view_widgets/last_update_container.dart';
import 'package:black_market/app/core/widgets/currencies_view_widgets/name_avatar.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeTopContainer extends GetView<CurrenciesController> {
  const HomeTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Container(
        decoration: BoxDecoration(
            color: AppColors.gray,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(120.r, 20.r),
                bottomRight: Radius.elliptical(120.r, 20.r))),
        height: 250.h,
        child: Padding(
          padding: EdgeInsets.all(8.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => controller.goToNotification(),
                      child: CircleAvatar(
                        backgroundColor: AppColors.blackDarkHover,
                        child: Icon(
                          Icons.notifications_none_outlined,
                          color: AppColors.blackLight,
                        ),
                      ),
                    ),
                    const NameAndAvatar()
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.blackMarketInEng,
                    style: TextStyle(
                        fontSize: 28.sp,
                        color: AppColors.yellowNormal,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    AppStrings.howMuchInBlackMarket,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.yellowLightActive,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      Container(
        height: 90.h,
        width: 350.w,
        decoration: BoxDecoration(
          color: AppColors.yellowLight,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 12.h,
            ),
            const CurrenciesContainer(),
            SizedBox(
              height: 10.h,
            ),
            const LastUpdateContainer()
          ],
        ),
      )
    ]);
  }
}
