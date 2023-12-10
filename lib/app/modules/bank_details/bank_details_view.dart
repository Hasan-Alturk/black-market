import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/core/widgets/select_currency_dialog.dart';
import 'package:black_market/app/modules/bank_details/bank_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BankDetailsView extends GetView<BankDetailsController> {
  const BankDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackDarkActive,
      body: SafeArea(
        child: ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.gray,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.elliptical(120, 20),
                            bottomRight: Radius.elliptical(120, 20))),
                    height: context.screenHeight * 0.35,
                    child: Padding(
                        padding: EdgeInsets.all(context.screenWidth * 0.03),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.all(context.screenWidth * 0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: Get.back,
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.blackDarkHover,
                                      child: Image.asset(
                                        AppAssetIcons.arrowLeft,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: context.screenHeight * 0.04,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.blackMarketInEng,
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: AppColors.yellowNormal,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: context.screenHeight * 0.01,
                                ),
                                Text(
                                  AppStrings.howMuchInBlackMarket,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.yellowLightActive,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: context.screenHeight * 0.01,
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  GetBuilder<BankDetailsController>(
                      id: "bankInfo",
                      builder: (_) {
                        return Container(
                            // height: context.screenHeight * 0.15,
                            width: context.screenWidth * 0.87,
                            decoration: BoxDecoration(
                              color: AppColors.yellowLight,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        controller.bankData.isEmpty
                                            ? ""
                                            : controller
                                                .bankData.first.bankName,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.darkGrey),
                                      ),
                                      controller.bankData.isEmpty
                                          ? Image.asset(
                                              AppAssetImage.bankMasr,
                                              height: 25,
                                              width: 25,
                                            )
                                          : Image.network(
                                              BaseUrls.storageUrl +
                                                  controller
                                                      .bankData.first.bankIcon,
                                              height: 25,
                                              width: 25,
                                            ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: context.screenHeight * 0.001,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            AppStrings.blackMarket,
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.lightGrey),
                                          ),
                                          Text(
                                            controller.currency.isNotEmpty
                                                ? "${controller.currency.first.blackMarketBuyPrice} ج.م"
                                                : "",
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.yellowDark),
                                          )
                                        ],
                                      ),
                                      Container(
                                        height: context.screenHeight * 0.04,
                                        width: 1,
                                        color: AppColors.lighterGrey,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            AppStrings.lastUpdate,
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.lightGrey),
                                          ),
                                          Text(
                                            controller.currency.isNotEmpty
                                                ? " منذ ${controller.currency.first.lastUpdate} دقيقة "
                                                : "",
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                color: AppColors.darkGrey,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                      Container(
                                        height: context.screenHeight * 0.03,
                                        width: 1,
                                        color: AppColors.lighterGrey,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            AppStrings.bankPrice,
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.lightGrey),
                                          ),
                                          Text(
                                            controller.currency.isNotEmpty
                                                ? "${controller.currency.first.sellPrice} ج.م"
                                                : "",
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                color: AppColors.darkGrey,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ));
                      })
                ],
              ),
              SizedBox(
                height: context.screenHeight * 0.01,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  width: context.screenWidth * 0.80,
                  decoration: BoxDecoration(
                    color: AppColors.yellowNormal,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      SizedBox(
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
                                            controller
                                                .getCurrencyInBank(currencyId);

                                            Get.back();
                                          });
                                    },
                                  );
                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.arrow_drop_down_sharp,
                                      ),
                                      Text(
                                        controller.currency.isNotEmpty
                                            ? controller
                                                .currency[0].currencyName
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
                                              controller
                                                  .currency[0].currencyIcon)
                                          : Image.asset(AppAssetImage.bankMasr)
                                    ]),
                              );
                            }),
                      ),
                      SizedBox(
                        height: context.screenHeight * 0.01,
                      ),
                      GetBuilder<BankDetailsController>(
                          id: "bankPrices",
                          builder: (_) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        AppStrings.sell,
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: AppColors.darkBlack,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        controller.currency.isNotEmpty
                                            ? "${controller.currency[0].sellPrice} ج.م"
                                            : "",
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: AppColors.darkBlack,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: context.screenHeight * 0.04,
                                    width: 1,
                                    color: AppColors.yellowDark,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppStrings.buy,
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: AppColors.darkBlack,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        controller.currency.isNotEmpty
                                            ? "${controller.currency[0].buyPrice} ج.م"
                                            : "",
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: AppColors.darkBlack,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.009,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: GetBuilder<BankDetailsController>(
                    id: "calculatorView",
                    builder: (_) {
                      return Container(
                        width: context.screenWidth * 0.80,
                        decoration: BoxDecoration(
                          color: AppColors.gray,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              _buildCalculatorRow(context),
                              SizedBox(
                                height: 11.h,
                              ),
                              _buildCalculateText(context),
                              SizedBox(
                                height: 11.h,
                              ),
                              _buildEqualityRow(context)
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: context.screenHeight * 0.009,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Container(
                    width: context.screenWidth,
                    decoration: BoxDecoration(
                      color: AppColors.gray,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: GetBuilder<BankDetailsController>(
                          id: "bankDetails",
                          builder: (_) {
                            return DataTable(
                                dividerThickness: 0,
                                showCheckboxColumn: false,
                                // Datatable widget that have the property columns and rows.
                                columns: [
                                  // Set the name of the column
                                  DataColumn(
                                    label: Text(
                                      AppStrings.coin,
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(AppStrings.buy,
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w700)),
                                  ),

                                  DataColumn(
                                    label: Text(AppStrings.sell,
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                ],
                                rows: [
                                  // Set the values to the columns
                                  for (var i in controller.bankData)
                                    DataRow(cells: [
                                      DataCell(Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Image.network(
                                              BaseUrls.storageUrl +
                                                  i.currencyIcon,
                                              height: 20.h,
                                              width: 20.w,
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 1,
                                          // ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              i.currencyName,
                                              style: TextStyle(
                                                  fontSize: 9.sp,
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ],
                                      )),
                                      DataCell(Text(i.buyPrice.toString(),
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: AppColors.yellowNormal,
                                              fontWeight: FontWeight.w700))),
                                      DataCell(Text(i.sellPrice.toString(),
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: AppColors.yellowNormal,
                                              fontWeight: FontWeight.w700))),
                                    ]),
                                ]);
                          }),
                    ),
                  ))
            ]),
      ),
    );
  }

  Widget _buildCalculatorRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  SizedBox(
                    width: context.screenWidth * 0.008,
                  ),
                  Text(
                    controller.bankData.isNotEmpty
                        ? controller.latestCurrencyList[0].code.toUpperCase()
                        : "",
                    style: TextStyle(
                        color: AppColors.gray,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                  SizedBox(
                    width: context.screenWidth * 0.008,
                  ),
                  controller.latestCurrencyList.isNotEmpty
                      ? Image.network(
                          BaseUrls.storageUrl +
                              controller.latestCurrencyList[0].icon,
                          height: 15,
                          width: 15,
                        )
                      : Image.asset(
                          AppAssetImage.bankMasr,
                          height: 15,
                          width: 15,
                        ),
                ],
              ),
            ),
            SizedBox(
              width: context.screenWidth * 0.02,
            ),
            Image.asset(AppAssetIcons.yellowDollar),
            SizedBox(
              width: context.screenWidth * 0.02,
            ),
            GestureDetector(
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
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Image.asset(AppAssetIcons.arrowDown),
                    SizedBox(
                      width: context.screenWidth * 0.008,
                    ),
                    Text(
                      controller.currency.isNotEmpty
                          ? controller.currency.first.currencyCode.toUpperCase()
                          : "",
                      style: TextStyle(
                          color: AppColors.gray,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp),
                    ),
                    SizedBox(
                      width: context.screenWidth * 0.008,
                    ),
                    controller.currency.isNotEmpty
                        ? Image.network(
                            BaseUrls.storageUrl +
                                controller.currency.first.currencyIcon,
                            width: 15,
                            height: 15,
                          )
                        : Image.asset(
                            AppAssetImage.avatar,
                            height: 15,
                            width: 15,
                          )
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: AppColors.yellowNormal,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.calculator,
                style: TextStyle(
                    color: AppColors.blackNormal, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: context.screenWidth * 0.007,
              ),
              Image.asset(AppAssetIcons.calculator),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCalculateText(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.045,
      width: context.screenWidth * 0.5,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.greyNormal,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(children: [
        ElevatedButton(
          onPressed: () {
            controller.calculateTotalPrice();
          },
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(EdgeInsets.all(4)),
            backgroundColor: MaterialStatePropertyAll(AppColors.yellowNormal),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.zero,
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.zero),
              ),
            ),
          ),
          child: Text(
            AppStrings.calculate,
            style: TextStyle(
                color: AppColors.blackNormal, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          width: context.screenWidth * 0.24,
          child: TextField(
            controller: controller.amountController.value,
            keyboardType: TextInputType.number,
            cursorColor: AppColors.yellowNormal,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.greyNormalActive),
            textAlign: TextAlign.right,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: AppStrings.enterAmount,
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.greyNormalActive)),
          ),
        ),
      ]),
    );
  }

  Widget _buildEqualityRow(BuildContext context) {
    return GetBuilder<BankDetailsController>(
        id: "totalAmount",
        builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: context.screenWidth * 0.3,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                padding: const EdgeInsets.all(5),
                child: Text(
                  controller.amountController.value.text.isNotEmpty
                      ? " ${num.parse(controller.amountController.value.text)} دولار امريكى "
                      : "1 دولار امريكى",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.blackNormal,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                width: context.screenWidth * 0.02,
              ),
              Image.asset(AppAssetIcons.equal),
              SizedBox(
                width: context.screenWidth * 0.02,
              ),
              Container(
                width: context.screenWidth * 0.3,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                padding: const EdgeInsets.all(5),
                child: Text(
                  "${controller.totalAmount} جنيه مصرى ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.blackNormal,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          );
        });
  }
}
