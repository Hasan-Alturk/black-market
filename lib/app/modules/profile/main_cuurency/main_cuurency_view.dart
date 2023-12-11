import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
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
          padding: const EdgeInsets.all(10),
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
                      String currencyName =
                          controller.latestCurrencyList[index].name.toString();

                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            height: 65.h,
                            decoration: BoxDecoration(
                              color: AppColors.gray,
                              border: Border.all(color: AppColors.gray),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    currencyName,
                                    style: TextStyle(
                                      color: AppColors.whiteLight,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
