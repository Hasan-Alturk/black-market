import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:black_market/app/modules/gold/main_gold/main_gold_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GoldCurrencyView extends GetView<MainGoldController> {
  const GoldCurrencyView({super.key});

  @override
  Widget build(BuildContext context) {
    bool filteredByCompany = false;
    controller.selectCoinCompany(true, 0);

    return Scaffold(
      backgroundColor: AppColors.blackNormal,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            SizedBox(
              height: 90.h,
              child: GetBuilder<MainGoldController>(
                id: "goldCompanyInCoins",
                builder: (_) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.goldCompanyList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 10.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                filteredByCompany = true;
                                controller.updateCoinsWidgetOnClickingOnCompany(
                                    controller.goldCompanyList[index].id);
                                controller.selectCoinCompany(true, index);
                              },
                              child: CircleAvatar(
                                  radius: 30.r,
                                  child: Image.network(
                                    BaseUrls.storageUrl +
                                        controller.goldCompanyList[index].image,
                                  )),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              key: Key(index.toString()), //attention
                              controller.goldCompanyList[index].name,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: index == controller.isCompanySelected
                                      ? AppColors.yellowNormal
                                      : AppColors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            GetBuilder<MainGoldController>(
                id: "coinsListView",
                builder: (_) {
                  return Expanded(
                    child: ListView.builder(
                      key: Key('builder ${controller.selected.toString()}'),
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.gray,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ExpansionTile(
                                  key: Key(index.toString()), //attention

                                  initiallyExpanded:
                                      index == controller.selected, //attention

                                  onExpansionChanged: (value) =>
                                      controller.selectTile(value, index),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: AppColors.yellowNormal),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.r),
                                    ),
                                  ),
                                  iconColor: AppColors.white,
                                  collapsedIconColor: AppColors.white,
                                  title: Text(
                                    filteredByCompany
                                        ? controller
                                            .filteredCoinsByCompany[index]!.name
                                            .toString()
                                        : controller.btcCoinsInfo[index].name
                                            .toString(),
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  children: [
                                    _buildTileDetails(
                                        AppStrings.gramPrice,
                                        filteredByCompany
                                            ? "${controller.filteredCoinsByCompany[index]!.sellPrice.toString()} ج.م"
                                            : "${controller.btcCoinsInfo[index].sellPrice.toString()} ج.م",
                                        AppColors.white),
                                    _buildTileDetails(
                                        AppStrings.gramManufacturing,
                                        filteredByCompany
                                            ? "${controller.filteredCoinsByCompany[index]!.workManShip.toString()} ج.م"
                                            : "${controller.btcCoinsInfo[index].workManShip.toString()} ج.م",
                                        AppColors.white),
                                    _buildTileDetails(
                                        AppStrings.totalTax,
                                        filteredByCompany
                                            ? "${controller.filteredCoinsByCompany[index]!.tax.toString()} ج.م"
                                            : "${controller.btcCoinsInfo[index].tax.toString()} ج.م",
                                        AppColors.white),
                                    _buildTileDetails(
                                        AppStrings
                                            .totalPriceWithManufacturingAndTax,
                                        filteredByCompany
                                            ? "${controller.filteredCoinsByCompany[index]!.totalPriceIncludingtaxAndWorkmanship.toString()} ج.م"
                                            : "${controller.btcCoinsInfo[index].totalPriceIncludingtaxAndWorkmanship.toString()} ج.م",
                                        AppColors.yellowNormal),
                                    _buildTileDetails(
                                        AppStrings.importAmount,
                                        filteredByCompany
                                            ? "${controller.filteredCoinsByCompany[index]!.returnFees.toString()} ج.م"
                                            : "${controller.btcCoinsInfo[index].returnFees.toString()} ج.م",
                                        AppColors.white),
                                    _buildTileDetails(
                                        AppStrings.difference,
                                        filteredByCompany
                                            ? "${controller.filteredCoinsByCompany[index]!.difference.toString()} ج.م"
                                            : "${controller.btcCoinsInfo[index].difference.toString()} ج.م",
                                        AppColors.white),
                                  ]),
                            ),
                          ),
                        );
                      },
                      itemCount: filteredByCompany
                          ? controller.filteredCoinsByCompany.length
                          : controller.btcCoinsInfo.length,
                    ),
                  );
                }),
          ],
        ),
      )),
    );
  }

  Widget _buildTileDetails(String text, String price, Color textColor) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.w, 4.h, 8.w, 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(color: textColor, fontWeight: FontWeight.w700),
          ),
          Text(
            price,
            style: TextStyle(color: textColor, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
