import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:black_market/app/core/widgets/select_currency_dialog.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CurrenciesContainer extends GetView<CurrenciesController> {
  const CurrenciesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: GetBuilder<CurrenciesController>(
          id: "currencies",
          builder: (_) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SelectCurrencyDialog(
                      latestCurrencyList: controller.latestCurrencyList,
                      onTap: (currencyId) {
                        controller.selectedCurrencyId = currencyId;
                        controller.getBanksAccordingToSelectedCurrency(
                            controller.selectedCurrencyId);
                        controller.getCurrencyInBank(currencyId);
                        controller.getHistoricalCurrencyLivePrices(controller
                            .time
                            .subtract(const Duration(days: 7))
                            .toString());
                        Get.back();
                      },
                    );
                  },
                );
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.arrow_drop_down_sharp),
                    Text(controller.currencyInBankList.isNotEmpty
                        ? controller.currencyInBankList[0].currencyName
                        : ""),
                    controller.currencyInBankList.isNotEmpty
                        ? Image.network(BaseUrls.storageUrl +
                            controller.currencyInBankList[0].currencyIcon)
                        : Image.asset(AppAssetImage.bankMasr)
                  ]),
            );
          }),
    );
  }
}
