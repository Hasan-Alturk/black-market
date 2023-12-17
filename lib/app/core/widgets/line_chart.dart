import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/model/historical_currency_live_prices.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
          child: LineChart(
            mainData(),
            curve: Curves.easeInBack,
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    List<FlSpot> spots = [];
    livePricesMap.forEach(
      (currency, livePricesList) {
        for (var livePrice in livePricesList) {
          double y = livePrice.price as double;
          var x = livePrice.date;
          DateTime apiDate = DateTime.parse(x);
          spots.add(FlSpot(apiDate.day.toDouble(), y));
        }
      },
    );
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
              interval: 1,
            ),
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
            .reduce((curr, next) => curr < next ? curr : next - 1),
        maxX: spots
            .map((spot) => spot.x)
            .reduce((curr, next) => curr > next ? curr : next + 1),
        minY: spots
                .map((spot) => spot.y)
                .reduce((curr, next) => curr < next ? curr : next) -
            5,
        maxY: spots
                .map((spot) => spot.y)
                .reduce((curr, next) => curr > next ? curr : next) +
            5,
        lineBarsData: [
          LineChartBarData(
            show: true,
            spots: spots,
            isCurved: true,
            curveSmoothness: 1,
            isStrokeJoinRound: true,
            barWidth: 3,
            isStrokeCapRound: true,
            preventCurveOverShooting: false,
            isStepLineChart: true,
            dotData: const FlDotData(
              show: false,
            ),
            gradient: LinearGradient(
              colors: gradientYellowColors,
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(colors: gradientRedColors),
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

    // حساب التاريخ الذي يتم عرضه على المحور
    DateTime displayedDate = sevenDaysAgo.add(Duration(days: value.toInt()));

    // تنسيق التاريخ باستخدام intl
    String formattedDate = DateFormat('MMM d').format(displayedDate);

    // قرر أي تواريخ ترغب في عرضها بناءً على value
    switch (value.toInt()) {
      case 11:
        formattedDate = DateFormat('MMM d')
            .format(sevenDaysAgo.add(const Duration(days: 1)));
        break;
      case 14:
        formattedDate = DateFormat('MMM d')
            .format(sevenDaysAgo.add(const Duration(days: 3)));
        break;
      case 17:
        formattedDate = DateFormat('MMM d')
            .format(sevenDaysAgo.add(const Duration(days: 7)));
        break;
      default:
        formattedDate = ""; // إعادة تعيين للأيام غير المحددة
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(formattedDate, style: style),
    );
  }
}
