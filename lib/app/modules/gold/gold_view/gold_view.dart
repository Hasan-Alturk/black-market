import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/widgets/gold_card_item.dart';
import 'package:black_market/app/modules/gold/main_gold/main_gold_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoldView extends GetView<MainGoldController> {
  const GoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackNormal,
      body: SafeArea(
          child: GetBuilder<MainGoldController>(
              id: "goldCard",
              builder: (_) {
                return GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 5),
                  itemCount: controller.goldList.length,
                  itemBuilder: (ctx, i) => GestureDetector(
                    child: GoldCardItem(
                      goldName: controller.goldList[i].name,
                      buyPrice:
                          controller.goldList[i].price.buyPrice.toString(),
                      price: controller.goldList[i].price.price.toString(),
                      goldImage: controller.goldList[i].icon,
                    ),
                    // onTap: () => controller.goToBankDetails(),
                  ),
                );
              })),
    );
  }
}
