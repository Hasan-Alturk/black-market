import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:black_market/app/core/widgets/select_currency_dialog.dart';
import 'package:black_market/app/modules/bank_details/bank_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CurrenciesInBankContainer extends GetView<BankDetailsController> {
  const CurrenciesInBankContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      child: GetBuilder<BankDetailsController>(
          id: "currenciesInBank",
          builder: (_) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SelectCurrencyDialog(
                        currencyList: controller.bankData,
                        onTap: (currencyId) {
                          controller.getCurrencyInBank(currencyId);

                          Get.back();
                        });
                  },
                );
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_drop_down_sharp,
                    ),
                    Text(
                      controller.currency.isNotEmpty
                          ? controller.currency[0].currencyName
                          : "",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.grey),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    controller.currency.isNotEmpty
                        ? Image.network(BaseUrls.storageUrl +
                            controller.currency[0].currencyIcon)
                        : Image.asset(AppAssetImage.bankMasr)
                  ]),
            );
          }),
    );
  }
}
