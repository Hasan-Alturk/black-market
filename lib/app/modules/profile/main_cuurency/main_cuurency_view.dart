import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/custom_app_bar.dart';
import 'package:black_market/app/modules/profile/main_cuurency/main_cuurency_controller.dart';
import 'package:flutter/material.dart';
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
          padding: EdgeInsets.all(context.screenWidth * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: context.screenHeight * 0.03),
              Text(
                AppStrings.selectTheBaseCurrency,
                style: TextStyle(
                  fontSize: 16 * context.textScale,
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: context.screenHeight * 0.03),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.currencies.length,
                  itemBuilder: (context, index) {
                    String currencyName = controller.currencies[index];

                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(context.screenWidth * 0.05),
                          height: context.screenHeight * 0.08,
                          decoration: BoxDecoration(
                            color: AppColors.gray,
                            border: Border.all(color: AppColors.gray),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => Radio<bool>(
                                  value:
                                      true, // ربما ترغب في تغيير هذا استنادًا إلى منطق التطبيق الخاص بك
                                  groupValue: controller.rememberCurrency.value,
                                  onChanged: (value) {
                                    controller.rememberCurrency.value = value!;
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) {
                                      if (states.contains(
                                              MaterialState.disabled) ||
                                          !controller.rememberCurrency.value) {
                                        return AppColors.white;
                                      }
                                      return AppColors.yellowDark;
                                    },
                                  ),
                                ),
                              ),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  currencyName,
                                  style: TextStyle(
                                    color: AppColors.whiteLight,
                                    fontSize: 14 * context.textScale,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: context.screenHeight * 0.03,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
