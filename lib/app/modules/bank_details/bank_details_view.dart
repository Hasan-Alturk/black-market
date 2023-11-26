import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:black_market/app/modules/bank_details/bank_details_controller.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
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
                    height: context.screenHeight * 0.4,
                    child: Padding(
                        padding: EdgeInsets.all(context.screenWidth * 0.03),
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
                                    CircleAvatar(
                                      backgroundColor: AppColors.blackDarkHover,
                                      child: Image.asset(
                                        AppAssetIcons.arrowLeft,
                                        color: AppColors.white,
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
                                  Container(
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const Text(
                                                " البنك المركزى المصرى",
                                              ),
                                              Image.asset(
                                                AppAssetImage.bankMasr,
                                                scale: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: context.screenHeight * 0.01,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    AppStrings.blackMarket,
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .lightGrey),
                                                  ),
                                                  Text(
                                                    "40 ج.م ",
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .yellowDark),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                height:
                                                    context.screenHeight * 0.04,
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
                                                        color: AppColors
                                                            .lightGrey),
                                                  ),
                                                  Text(
                                                    "منذ 15 دقيقة",
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.darkGrey,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                height:
                                                    context.screenHeight * 0.03,
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
                                                        color: AppColors
                                                            .lightGrey),
                                                  ),
                                                  Text(
                                                    "30.25 ج.م ",
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.darkGrey,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  )
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
                      // Instead Of Text There is dropdown list
                      const Text("الدولار الامريكى"),
                      SizedBox(
                        height: context.screenHeight * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  AppStrings.sell,
                                  style: TextStyle(
                                      color: AppColors.darkBlack,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "40 ج.م ",
                                  style: TextStyle(
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
                                      color: AppColors.darkBlack,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "40 ج.م ",
                                  style: TextStyle(
                                      color: AppColors.darkBlack,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
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
                child: Container(
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
                          height: context.screenHeight * 0.009,
                        ),
                        _buildCalculateText(context),
                        SizedBox(
                          height: context.screenHeight * 0.009,
                        ),
                        _buildEqualityRow(context)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.009,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Container(
                    width: context.screenWidth * 0.80,
                    decoration: BoxDecoration(
                      color: AppColors.gray,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: DataTable(
                            dividerThickness: 0,
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
                              DataRow(cells: [
                                DataCell(Text(
                                  "دولار أمريكي / USD",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w700),
                                )),
                                DataCell(Text("30.24",
                                    style: TextStyle(
                                        color: AppColors.yellowNormal,
                                        fontWeight: FontWeight.w700))),
                                DataCell(Text("30.24",
                                    style: TextStyle(
                                        color: AppColors.yellowNormal,
                                        fontWeight: FontWeight.w700))),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "دولار أمريكي / USD",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w700),
                                )),
                                DataCell(Text("30.24",
                                    style: TextStyle(
                                        color: AppColors.yellowNormal,
                                        fontWeight: FontWeight.w700))),
                                DataCell(Text("30.24",
                                    style: TextStyle(
                                        color: AppColors.yellowNormal,
                                        fontWeight: FontWeight.w700))),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "دولار أمريكي / USD",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w700),
                                )),
                                DataCell(Text("30.24",
                                    style: TextStyle(
                                        color: AppColors.yellowNormal,
                                        fontWeight: FontWeight.w700))),
                                DataCell(Text("30.24",
                                    style: TextStyle(
                                        color: AppColors.yellowNormal,
                                        fontWeight: FontWeight.w700))),
                              ]),
                              DataRow(cells: [
                                DataCell(Text(
                                  "دولار أمريكي / USD",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w700),
                                )),
                                DataCell(Text("30.24",
                                    style: TextStyle(
                                        color: AppColors.yellowNormal,
                                        fontWeight: FontWeight.w700))),
                                DataCell(Text("30.24",
                                    style: TextStyle(
                                        color: AppColors.yellowNormal,
                                        fontWeight: FontWeight.w700))),
                              ]),
                            ]),
                      ),
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
            ElevatedButton(
              style: ButtonStyle(
                padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                backgroundColor: MaterialStatePropertyAll(AppColors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                  ),
                ),
              ),
              onPressed: () {
                showCurrencyPicker(
                  context: context,
                  showFlag: true,
                  showSearchField: false,
                  showCurrencyName: true,
                  showCurrencyCode: true,
                  favorite: ['egp', 'usd'],
                  onSelect: (Currency currency) {
                    print('Select currency: ${currency.name}');
                  },
                );
              },
              child: Row(
                children: [
                  Image.asset(AppAssetIcons.arrowDown),
                  SizedBox(
                    width: context.screenWidth * 0.008,
                  ),
                  Text(
                    "USD",
                    style: TextStyle(color: AppColors.gray),
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
            ElevatedButton(
              style: ButtonStyle(
                padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                backgroundColor: MaterialStatePropertyAll(AppColors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                  ),
                ),
              ),
              onPressed: () {
                showCurrencyPicker(
                  context: context,
                  showFlag: true,
                  showSearchField: false,
                  showCurrencyName: true,
                  showCurrencyCode: true,
                  favorite: ['egp', 'usd'],
                  onSelect: (Currency currency) {
                    print('Select currency: ${currency.name}');
                  },
                );
              },
              child: Row(
                children: [
                  Image.asset(AppAssetIcons.arrowDown),
                  SizedBox(
                    width: context.screenWidth * 0.008,
                  ),
                  Text(
                    "USD",
                    style: TextStyle(color: AppColors.gray),
                  ),
                ],
              ),
            ),
          ],
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppColors.yellowNormal),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
              ),
            ),
          ),
          onPressed: () {},
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
          onPressed: () {},
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
          child: const Text(
            "40.1 جنيه مصري",
            textAlign: TextAlign.center,
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
          child: const Text(
            "1 دولار أمريكي",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
