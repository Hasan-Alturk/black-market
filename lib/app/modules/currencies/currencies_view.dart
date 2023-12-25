import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_asset_image.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_strings.dart';
import 'package:black_market/app/core/constants/base_urls.dart';
import 'package:black_market/app/core/widgets/card_item.dart';
import 'package:black_market/app/core/widgets/line_chart.dart';
import 'package:black_market/app/core/widgets/select_currency_dialog.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CurrenciesView extends GetView<CurrenciesController> {
  const CurrenciesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blackDarkActive,
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await controller.getLatestCurrency();
              await controller.getBanks();
            },
            child: ListView(
              children: [
                Stack(alignment: Alignment.bottomCenter, children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.gray,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(120.r, 20.r),
                            bottomRight: Radius.elliptical(120.r, 20.r))),
                    height: 280.h,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => controller.goToNotification(),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.blackDarkHover,
                                    child: Icon(
                                      Icons.notifications_none_outlined,
                                      color: AppColors.blackLight,
                                    ),
                                  ),
                                ),
                                GetBuilder<CurrenciesController>(
                                    id: "name_and_avatar",
                                    builder: (_) {
                                      return Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                AppStrings.hello,
                                                style: TextStyle(
                                                  color: AppColors
                                                      .blackLightActive,
                                                ),
                                              ),
                                              Text(
                                                controller.name,
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          controller.avatar == ""
                                              ? const SizedBox()
                                              : CircleAvatar(
                                                  radius: 24.r,
                                                  child: Image.network(
                                                    BaseUrls.storageUrl +
                                                        controller.avatar,
                                                  ),
                                                )
                                        ],
                                      );
                                    }),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.blackMarketInEng,
                                style: TextStyle(
                                    fontSize: 28.sp,
                                    color: AppColors.yellowNormal,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                AppStrings.howMuchInBlackMarket,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.yellowLightActive,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                      color: AppColors.yellowLight,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 12.h,
                        ),
                        SizedBox(
                          height: 15.h,
                          child: GetBuilder<CurrenciesController>(
                              id: "currencies",
                              builder: (_) {
                                return GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SelectCurrencyDialog(
                                          latestCurrencyList:
                                              controller.latestCurrencyList,
                                          onTap: (currencyId) {
                                            controller.selectedCurrencyId =
                                                currencyId;
                                            controller
                                                .getBanksAccordingToSelectedCurrency(
                                                    controller
                                                        .selectedCurrencyId);
                                            controller
                                                .getCurrencyInBank(currencyId);
                                            controller
                                                .getHistoricalCurrencyLivePrices();
                                            Get.back();
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.arrow_drop_down_sharp),
                                        Text(controller
                                                .currencyInBankList.isNotEmpty
                                            ? controller.currencyInBankList[0]
                                                .currencyName
                                            : ""),
                                        controller.currencyInBankList.isNotEmpty
                                            ? Image.network(
                                                BaseUrls.storageUrl +
                                                    controller
                                                        .currencyInBankList[0]
                                                        .currencyIcon)
                                            : Image.asset(
                                                AppAssetImage.bankMasr)
                                      ]),
                                );
                              }),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GetBuilder<CurrenciesController>(
                            id: "lastUpdateContainer",
                            builder: (_) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    if (controller.currency.isNotEmpty)
                                      controller.currency.first
                                                  .blackMarketBuyPrice !=
                                              null
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  AppStrings.blackMarket,
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.lightGrey),
                                                ),
                                                Text(
                                                  controller.currency.isNotEmpty
                                                      ? "${controller.currency.first.blackMarketBuyPrice} ج.م"
                                                      : "",
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          AppColors.yellowDark),
                                                ),
                                              ],
                                            )
                                          : const SizedBox.shrink(),
                                    if (controller.currency.isNotEmpty)
                                      controller.currency.first
                                                  .blackMarketBuyPrice !=
                                              null
                                          ? Container(
                                              height: 30.h,
                                              width: 1,
                                              color: AppColors.lighterGrey,
                                            )
                                          : const SizedBox.shrink(),
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
                                      height: 30.h,
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
                                              ? "${controller.currency.first.livePrice} ج.م"
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
                              );
                            }),
                      ],
                    ),
                  )
                ]),
                SizedBox(
                  height: 10.h,
                ),
                GetBuilder<CurrenciesController>(
                    id: "Chart",
                    builder: (_) {
                      if (controller.isLoading) {
                        return SizedBox(
                          height: 380.h,
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.yellowDark,
                            ),
                          ),
                        );
                      } else {
                        return Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 250.w,
                                height: 30.h,
                                child: DefaultTabController(
                                    length: 2,
                                    child: TabBar(
                                      labelColor: AppColors.gray,
                                      unselectedLabelColor:
                                          AppColors.yellowNormal,
                                      tabs: const [Text("Live"), Text("Black")],
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      dividerColor: Colors.transparent,
                                      indicator: BubbleTabIndicator(
                                        indicatorHeight: 25.0,
                                        indicatorColor: AppColors.yellowNormal,
                                        tabBarIndicatorSize:
                                            TabBarIndicatorSize.tab,
                                        // Other flags
                                        // indicatorRadius: 1,
                                        // insets: EdgeInsets.all(1),
                                        // padding: EdgeInsets.all(10)
                                      ),
                                    )),
                              ),
                            ),
                            Stack(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 35.w, top: 35.h),
                                  child: GetBuilder<CurrenciesController>(
                                      id: "text_chart",
                                      builder: (_) {
                                        return Text(
                                          controller.textChart,
                                          style: TextStyle(
                                            color: AppColors.yellowDark,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        );
                                      }),
                                ),
                                Chart(
                                  livePricesMap: controller.livePricesMap,
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                    }),
                // const DraggableHome(
                //   title: Text("data"),
                //   headerWidget: Text("اضغط لأسفل لعرض المزيد"),
                //   body: [],
                // ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  height: 100.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                    color: AppColors.yellowNormal,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      GetBuilder<CurrenciesController>(
                          id: "averageContainer",
                          builder: (_) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child:
                                        Image.asset(AppAssetIcons.calculator),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppStrings.sell,
                                        style: TextStyle(
                                            color: AppColors.darkBlack,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "${controller.avgSellPrice.toStringAsFixed(2)} ج.م ",
                                        style: TextStyle(
                                            color: AppColors.darkBlack,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: 30.h,
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
                                        "${controller.avgBuyPrice.toStringAsFixed(2)} ج.م ",
                                        style: TextStyle(
                                            color: AppColors.darkBlack,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: 30.h,
                                    width: 1,
                                    color: AppColors.yellowDark,
                                  ),
                                  Text(
                                    AppStrings.avgPrice,
                                    style: TextStyle(
                                        color: AppColors.darkBlack,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: GetBuilder<CurrenciesController>(
                      id: "bankList",
                      builder: (_) {
                        return GridView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 15),
                            itemCount: controller.currencyInBankList.length,
                            itemBuilder: (ctx, i) => GestureDetector(
                                child: CardItem(
                                  bankName: controller
                                      .currencyInBankList[i].bankName
                                      .toString(),
                                  bankImage: controller
                                      .currencyInBankList[i].bankIcon
                                      .toString(),
                                  sellPrice: controller
                                      .currencyInBankList[i].sellPrice,
                                  buyPrice:
                                      controller.currencyInBankList[i].buyPrice,
                                ),
                                onTap: () => controller.goToBankDetails(
                                    controller.currencyInBankList[i].bankId)));
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
