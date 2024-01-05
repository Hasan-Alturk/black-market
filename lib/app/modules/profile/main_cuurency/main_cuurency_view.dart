import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/core/widgets/custom_container_drag.dart';
import 'package:black_market/app/modules/profile/main_cuurency/main_cuurency_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainCurencyView extends GetView<MainCurencyController> {
  const MainCurencyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: AppStrings.mainCurrency,
        onTap: () => Get.back(),
      ),
      backgroundColor: AppColors.blackNormalHover,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 20.h),
              Text(
                AppStrings.selectTheBaseCurrency,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: GetBuilder<MainCurencyController>(builder: (_) {
                  return ListView.builder(
                    itemCount: controller.latestCurrencyList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CustomContainerDrag(
                            text: controller.latestCurrencyList[index].name
                                .toString(),
                            stringImage: controller
                                .latestCurrencyList[index].icon
                                .toString(),
                            stringIcon: AppAssetIcons.arrowDown,
                          ),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
