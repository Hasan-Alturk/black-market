import 'dart:developer';

import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/model/historical_currency_live_prices.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chart extends GetView<CurrenciesController> {
  List<Color> gradientYellowColors = [
    AppColors.startYellowGrad,
    AppColors.endYellowGrad,
  ];

  List<Color> gradientRedColors = [
    AppColors.startRedGrad,
    AppColors.endRedGrad,
  ];
  Map<String, List<LivePrices>> livePricesMap;

  Chart({super.key, required this.livePricesMap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.2,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 35,
              left: 35,
            ),
            child: Container(),

            // child: GetBuilder<CurrenciesController>(builder: (_) {
            //   return LineChart(
            //     mainData(),
            //   );
            // }),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    List<FlSpot> spots = [];
    livePricesMap.forEach(
      (currency, livePricesList) {
        log('العملة: $currency');

        // الدوران عبر قائمة كائنات LivePrices
        for (var livePrice in livePricesList) {
          var y = livePrice.price;
          var x = livePrice.date;

          DateTime apiDate = DateTime.parse(x);

          log('معرف العملة: ${livePrice.currencyId}');
          log('السعر: ${livePrice.price}');
          log('التاريخ: ${livePrice.date}');
          log('--------------');
          log(x);
          log(y.toString());

          spots.add(FlSpot(apiDate.day.toDouble(), y as double));
        }
      },
    );

    return LineChartData(
      gridData: const FlGridData(
        show: true,
        drawHorizontalLine: false,
        drawVerticalLine: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 22,
            getTitlesWidget: rightTitleWidgets,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 31,
      minY: 0,
      maxY: 50,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: false,
          gradient: LinearGradient(
            colors: gradientYellowColors,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(colors: gradientRedColors),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: AppColors.graylight,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text('Nov 15', style: style);
        break;
      case 5:
        text = Text('Nov 29', style: style);
        break;
      case 8:
        text = Text('Dec15', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: AppColors.greyMoreLight,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '13';
        break;
      case 3:
        text = '15';
        break;
      case 5:
        text = '20';
        break;
      default:
        return const SizedBox();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
