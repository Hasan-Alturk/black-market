import 'package:black_market/app/core/widgets/currencies_view_widgets/card_item.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankList extends GetView<CurrenciesController> {
  const BankList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GetBuilder<CurrenciesController>(
          id: "bankList",
          builder: (_) {
            return GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 15),
                itemCount: controller.currencyInBankList.length,
                itemBuilder: (ctx, i) => GestureDetector(
                    child: CardItem(
                      bankName:
                          controller.currencyInBankList[i].bankName.toString(),
                      bankImage:
                          controller.currencyInBankList[i].bankIcon.toString(),
                      sellPrice: controller.currencyInBankList[i].sellPrice,
                      buyPrice: controller.currencyInBankList[i].buyPrice,
                      onFavouriteTapped: () => controller.addToFavourite(controller.currencyInBankList[i].bankId),
                    ),
                    onTap: () => controller.goToBankDetails(
                        controller.currencyInBankList[i].bankId)));
          }),
    );
  }
}
