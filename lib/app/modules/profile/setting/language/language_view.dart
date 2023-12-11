import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/modules/profile/setting/language/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LanguageView extends GetView<LanguageController> {
  const LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormalHover,
      appBar: CustomAppBar(
        text: AppStrings.setting,
        onTap: () => Get.back(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 25.h,
              ),
              Text(
                AppStrings.selectLanguage,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Expanded(
                child: Column(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Radio<bool>(
                            value: true,
                            groupValue: controller.rememberLanguage,
                            onChanged: (value) {
                              if (value != null) {
                                controller.rememberLanguage = value;
                              }
                            },
                            fillColor: MaterialStateColor.resolveWith(
                              (states) {
                                if (states.contains(MaterialState.disabled) ||
                                    !controller.rememberLanguage) {
                                  return AppColors.white;
                                }
                                return AppColors.yellowDark;
                              },
                            ),
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              controller.languages[0],
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
