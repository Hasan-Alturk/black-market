import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/model/historical_currency_live_prices.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ChartPrice extends GetView<CurrenciesController> {
  Map<String, List<LivePrices>> livePricesMap = {};
  List<TimeData> lineData = [];
  List<Color> colors = [];

  ChartPrice({super.key, required this.livePricesMap});

  @override
  Widget build(BuildContext context) {
    livePricesMap.forEach((currency, livePricesList) {
      for (var livePrice in livePricesList) {
        double y = livePrice.price.toDouble();
        String? apiDate = livePrice.date;
        DateTime x = DateTime.parse(apiDate);
        lineData.add(TimeData(domain: x, measure: y));
      }
    });
    Color getAreaColors(
      TimeGroup group,
      TimeData timeData,
      int index,
    ) {
      if (index < group.data.length - 1) {
        return group.data[index].measure > group.data[index + 1].measure
            ? Colors.green.withOpacity(0.35)
            : Colors.red.withOpacity(0.35);
      } else {
        return Colors.grey.withOpacity(0.35);
      }
    }

    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.1,
          child: DChartLineT(
            configRenderLine: ConfigRenderLine(
              includeArea: true,
              includePoints: true,
              radiusPx: 5.sp,
              strokeWidthPx: 3.sp,
            ),
            areaColor: (group, timeData, index) =>
                getAreaColors(group, timeData, index!),
            fillColor: (group, timeData, index) =>
                getAreaColors(group, timeData, index!),
            measureAxis: MeasureAxis(
              showLine: true,
              thickLength: 5,
              gapAxisToLabel: 10,
              labelStyle: LabelStyle(color: AppColors.graylight),
              labelAnchor: LabelAnchor.centered,
            ),
            domainAxis: DomainAxis(
              showLine: true,
              thickLength: 5,
              gapAxisToLabel: 15,
              labelStyle: LabelStyle(
                color: AppColors.graylight,
              ),
              labelAnchor: LabelAnchor.centered,
            ),
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
