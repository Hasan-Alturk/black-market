import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/currency_item.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectCurrencyDialog extends GetView<CurrenciesController> {
  const SelectCurrencyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 500.h,
        width: 300.w,
        decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.circular(20),
        ),
        child: GetBuilder<CurrenciesController>(
            id: "currencyList",
            builder: (context) {
              return SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: controller.latestCurrencyList.length,
                        itemBuilder: (ctx, index) => GestureDetector(
                              onTap: () {
                                controller.selectedCurrencyId = controller
                                    .latestCurrencyList[index].id!
                                    .toInt();
                                controller.currenyAccordingToBankInfo(
                                    controller.selectedCurrencyId);
                                Get.back;
                              },
                              child: CurrencyItem(
                                currencyName: controller
                                    .latestCurrencyList[index].name
                                    .toString(),
                                currenyImage: controller
                                    .latestCurrencyList[index].icon
                                    .toString(),
                              ),
                            ))),
              );
            }),
      ),
    );
  }
}
