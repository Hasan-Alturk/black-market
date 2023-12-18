import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/model/historical_currency_live_prices.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Chart extends GetView<CurrenciesController> {
  List<FlSpot> spots = [];

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
          aspectRatio: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: LineChart(
              mainData(),
              curve: Curves.easeInBack,
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    livePricesMap.forEach(
      (currency, livePricesList) {
        for (var livePrice in livePricesList) {
          double y = livePrice.price.toDouble();
          String apiDate = livePrice.date;
          DateTime x = DateTime.parse(apiDate);
          spots.add(FlSpot(x.day.toDouble(), y));
        }
      },
    );
    List<Color> lineColors = [];

    for (int i = 0; i < spots.length; i++) {
      FlSpot currentSpot = spots[i];

      if (i == 0 || currentSpot.y > spots[i - 1].y) {
        lineColors.add(AppColors.yellowDark);
      } else {
        lineColors.add(AppColors.endRedGrad);
      }
    }
    if (spots.isNotEmpty) {
      return LineChartData(
        gridData: const FlGridData(
          show: true,
          drawHorizontalLine: false,
          drawVerticalLine: false,
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: bottomTitleWidgets,
                interval: 1),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        minX: spots
            .map((spot) => spot.x)
            .reduce((curr, next) => curr < next ? curr : next),
        maxX: spots
            .map((spot) => spot.x)
            .reduce((curr, next) => curr > next ? curr : next),
        minY: spots
            .map((spot) => spot.y)
            .reduce((curr, next) => curr < next ? curr : next),
        maxY: spots
            .map((spot) => spot.y)
            .reduce((curr, next) => curr > next ? curr : next),
        lineBarsData: [
          LineChartBarData(
            show: true,
            spots: spots,
            isCurved: true,
            curveSmoothness: 0,
            isStrokeJoinRound: false,
            barWidth: 3,
            preventCurveOverShooting: true,
            isStepLineChart: false,
            dotData: const FlDotData(
              show: false,
            ),
            gradient: LinearGradient(
              colors: lineColors,
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: lineColors,
              ),
            ),
          ),
        ],
      );
    } else {
      return LineChartData();
    }
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: AppColors.graylight,
    );
    // حساب تاريخ اليوم
    DateTime today = DateTime.now();

    // حساب تاريخ اليوم قبل 7 أيام
    DateTime sevenDaysAgo = today.subtract(const Duration(days: 7));
    int dayNumber = sevenDaysAgo.day;

    // تنسيق التاريخ باستخدام intl
    String formattedDate = DateFormat('MMM d').format(sevenDaysAgo);

    // قرر أي تواريخ ترغب في عرضها بناءً على value
    switch (value.toInt()) {
      case 13:
        formattedDate = DateFormat('MMM d')
            .format(sevenDaysAgo.add(const Duration(days: 0)));
        break;
      case 15:
        formattedDate = DateFormat('MMM d')
            .format(sevenDaysAgo.add(const Duration(days: 3)));
        break;
      case 18:
        formattedDate = DateFormat('MMM d')
            .format(sevenDaysAgo.add(const Duration(days: 7)));
        break;
      default:
        formattedDate = ""; // إعادة تعيين للأيام غير المحددة
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      fitInside: const SideTitleFitInsideData(
          enabled: true,
          axisPosition: 0,
          parentAxisSize: 1,
          distanceFromEdge: 0),
      child: Text(formattedDate, style: style),
    );
  }
}
