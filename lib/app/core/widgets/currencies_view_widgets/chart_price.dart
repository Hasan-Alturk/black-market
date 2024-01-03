import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/model/historical_currency_live_prices.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ChartPrice extends GetView<CurrenciesController> {
  Map<String, List<LivePrices>> livePricesMap = {};
  List<TimeData> lineData = [];
  List<DateTime> domains = [];

  ChartPrice({super.key, required this.livePricesMap});

  @override
  Widget build(BuildContext context) {
    livePricesMap.forEach((currency, livePricesList) {
      for (var livePrice in livePricesList) {
        double y = livePrice.price.toDouble();
        String? apiDate = livePrice.date;
        DateTime x = DateTime.parse(apiDate);

        domains.add(x);
        lineData.add(TimeData(domain: x, measure: y));
      }
    });

    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1,
          child: DChartLineT(
            configRenderLine: ConfigRenderLine(
              includeArea: true,
            ),
            areaColor: (group, ordinalData, index) {
              if (ordinalData.measure > ordinalData.measure) {
                return Colors.green.withOpacity(0.3);
              } else {
                return Colors.red.withOpacity(0.3);
              }
            },
            groupList: [
              TimeGroup(
                id: '1',
                color: AppColors.yellowDark,
                data: lineData,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
