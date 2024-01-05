import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/model/historical_currency_live_prices.dart';
import 'package:black_market/app/modules/currencies/currencies_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ChartLive extends GetView<CurrenciesController> {
  List<FlSpot> spots = [];
  List axisX = [];
  List<Color> lineColors = [];
  Map<String, List<LivePrices>> livePricesMap = {};

  ChartLive({super.key, required this.livePricesMap});

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
              curve: Curves.ease,
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    livePricesMap.forEach(
      (currency, livePricesList) {
        if (livePricesList.isNotEmpty) {
          DateTime startDate = DateTime.parse(livePricesList[0].date);

          for (LivePrices livePrice in livePricesList) {
            double y = livePrice.price.toDouble();
            String? apiDate = livePrice.date;
            DateTime x = DateTime.parse(apiDate);
            String formattedDate = DateFormat('d MMM').format(x);

            int days = x.difference(startDate).inDays;

            if (!axisX.contains(formattedDate)) {
              axisX.add(formattedDate);
              spots.add(FlSpot(days.toDouble(), y));
            }
          }
        }
      },
    );

    for (int i = 0; i < spots.length; i++) {
      FlSpot currentSpot = spots[i];

      if (i == 0 || currentSpot.y >= spots[i - 1].y) {
        lineColors.add(AppColors.yellowDark);
      } else {
        lineColors.add(AppColors.redGrad);
      }
    }

    if (spots.isNotEmpty) {
      return LineChartData(
        extraLinesData: const ExtraLinesData(),
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
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: leftTitleWidgets,
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
                final int xValue = touchedSpot.x.toInt();
                final String yValue = touchedSpot.y.toString();

                if (xValue < axisX.length) {
                  DateFormat format = DateFormat("d MMM");
                  DateTime date = format.parse(axisX[xValue]);
                  String formattedDate = DateFormat('d MMM').format(date);

                  controller.getTextChart('$yValue Egp \n$formattedDate');
                }
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
            isCurved: false,
            barWidth: 3,
            isStepLineChart: false,
            dotData: const FlDotData(
              show: false,
            ),
            gradient: LinearGradient(
              colors: lineColors,
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
      fontSize: 14.sp,
      color: AppColors.graylight,
    );

    String formattedDate = axisX[value.toInt()];

    if (value % 6 == 0) {
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 10.h,
        child: Text(formattedDate, style: style),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  var style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14.sp,
    color: AppColors.graylight,
  );

  if (value % 2 == 0 ||
      value % 3 == 0 ||
      value % 4 == 0 ||
      value % 5 == 0 ||
      value % 6 == 0 ||
      value % 7 == 0 ||
      value % 8 == 0) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 5.w,
      child: Text("${value.toInt()}", style: style),
    );
  } else {
    return const SizedBox.shrink();
  }
}
