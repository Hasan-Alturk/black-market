import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/model/historical_currency_live_prices.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ChartPrice extends GetView<CurrenciesController> {
  List<FlSpot> spots = [];
  List<Color> lineColors = [];
  List axisX = [];

  List<Color> gradientYellowColors = [
    AppColors.startYellowGrad,
    AppColors.endYellowGrad,
  ];

  List<Color> gradientRedColors = [
    AppColors.startRedGrad,
    AppColors.endRedGrad,
  ];
  Map<String, List<LivePrices>> livePricesMap = {};

  ChartPrice({super.key, required this.livePricesMap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.1,
          child: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 20.w),
            child: LineChart(
              mainData(),
              curve: Curves.easeInToLinear,
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

          if (!axisX.contains(x)) {
            axisX.add(x);
            spots.add(FlSpot(x.day.toDouble(), y));
          }
        }
      },
    );

    for (int i = 0; i < spots.length; i++) {
      FlSpot currentSpot = spots[i];

      if (i == 0 || currentSpot.y >= spots[i - 1].y) {
        lineColors.add(AppColors.yellowDark);
      } else {
        lineColors.add(AppColors.startRedGrad);
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
              getTitlesWidget: bottomTitleWidget,
              interval: 1,
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: leftTitleWidgets,
              interval: 1,
            ),
          ),
        ),
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: AppColors.gray,
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((LineBarSpot touchedSpot) {
                TextStyle textStyle = TextStyle(
                  color: AppColors.yellowNormal,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                );

                return LineTooltipItem(
                  '${touchedSpot.y}',
                  textStyle,
                );
              }).toList();
            },
          ),
          touchCallback: (event, touchResponse) {
            if (touchResponse != null &&
                touchResponse.lineBarSpots != null &&
                touchResponse.lineBarSpots!.isNotEmpty) {
              const int selectedSpotIndex = 0;
              if (selectedSpotIndex < touchResponse.lineBarSpots!.length) {
                final TouchLineBarSpot touchedSpot =
                    touchResponse.lineBarSpots!.elementAt(selectedSpotIndex);
                final String xValue = touchedSpot.x.toInt().toString();
                final String yValue = touchedSpot.y.toString();
                String data = DateFormat('MMM').format(axisX[0]);
                controller.getTextChart('EGP\t $yValue\n$data\t\t\t\t$xValue');
              }
            }
          },
          handleBuiltInTouches: true,
        ),
        borderData: FlBorderData(
          show: true,
          border: Border(
            bottom: BorderSide(color: AppColors.gray),
            left: BorderSide(color: AppColors.gray),
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
                .reduce((curr, next) => curr < next ? curr : next) -
            0.2,
        maxY: spots
                .map((spot) => spot.y)
                .reduce((curr, next) => curr > next ? curr : next) +
            0.3,
        lineBarsData: [
          LineChartBarData(
            show: true,
            spots: spots,
            isCurved: true,
            barWidth: 3,
            isStepLineChart: false,
            dotData: const FlDotData(
              show: false,
            ),
            gradient: LinearGradient(
              colors: lineColors,
            ),
            belowBarData: BarAreaData(
              show: false,
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

  Widget bottomTitleWidget(double value, TitleMeta meta) {
    var style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14.sp,
      color: AppColors.graylight,
    );
    // String formattedDate = switch (value.toInt()) {
    //   23 => DateFormat('MMM d').format(axisX[24]),
    //   25 => DateFormat('MMM d').format(axisX[2]),
    //   27 => DateFormat('MMM d').format(axisX[4]),
    //   29 => DateFormat('MMM d').format(axisX[6]),
    //   _ => ""
    // };
    if (value % 3 == 0) {
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 10,
        child: Text("${value.toInt()}", style: style),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14.sp,
      color: AppColors.graylight,
    );

    if (value % 2 == 0) {
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 5.w,
        child: Text("${value.toInt()}", style: style),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
