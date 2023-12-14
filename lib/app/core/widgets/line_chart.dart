import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineChart extends StatefulWidget {
  const LineChart({super.key});

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: 375.w,
      child: Sparkline(
        data: data,
        averageLabel: false,
      ),
    );
  }
}















// import 'package:black_market/app/core/constants/app_colors.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class LineChartSample2 extends StatefulWidget {
//   const LineChartSample2({super.key});

//   @override
//   State<LineChartSample2> createState() => _LineChartSample2State();
// }

// class _LineChartSample2State extends State<LineChartSample2> {
//   List<Color> gradientColors = [
//     AppColors.startYellowGrad,
//     AppColors.endYellowGrad,
//   ];

//   bool showAvg = false;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         AspectRatio(
//           aspectRatio: 1.2,
//           child: Padding(
//             padding: const EdgeInsets.only(
//               right: 18,
//               left: 12,
//               top: 20,
//               bottom: 10,
//             ),
//             child: LineChart(
//               showAvg ? avgData() : mainData(),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 60,
//           height: 34,
//           child: TextButton(
//             onPressed: () {
//               setState(() {
//                 showAvg = !showAvg;
//               });
//             },
//             child: Text(
//               'avg',
//               style: TextStyle(
//                 fontSize: 12,
//                 color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget bottomTitleWidgets(double value, TitleMeta meta) {
//     var style = TextStyle(
//       color: AppColors.greyMoreLight,
//       fontWeight: FontWeight.bold,
//       fontSize: 16,
//     );
//     Widget text;
//     switch (value.toInt()) {
//       case 1:
//         text = Text('سبت', style: style);
//         break;
//       case 3:
//         text = Text('أحد', style: style);
//         break;
//       case 5:
//         text = Text('اثنين', style: style);
//         break;
//       case 7:
//         text = Text('ثلاثاء', style: style);
//         break;
//       case 9:
//         text = Text('أربعاء', style: style);
//         break;
//       case 11:
//         text = Text('خميس', style: style);
//         break;
//       case 13:
//         text = Text('جمعة', style: style);
//         break;
//       default:
//         text = Text('', style: style);
//         break;
//     }

//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       child: text,
//     );
//   }

//   Widget leftTitleWidgets(double value, TitleMeta meta) {
//     const style = TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 15,
//     );
//     String text;
//     switch (value.toInt()) {
//       case 1:
//         text = '10K';
//         break;
//       case 3:
//         text = '30k';
//         break;
//       case 5:
//         text = '50k';
//         break;
//       default:
//         return Container();
//     }

//     return Text(text, style: style, textAlign: TextAlign.left);
//   }

//   LineChartData mainData() {
//     return LineChartData(
//       gridData: FlGridData(
//         show: true,
//         drawHorizontalLine: false,
//         drawVerticalLine: true,
//         horizontalInterval: 1,
//         verticalInterval: 1,
//         getDrawingHorizontalLine: (value) {
//           return FlLine(
//             color: AppColors.yellowDark,
//             strokeWidth: 1,
//           );
//         },
//         getDrawingVerticalLine: (value) {
//           return FlLine(
//             color: value % 2 != 0 ? AppColors.yellowDark : AppColors.blackDark,
//             strokeWidth: 1,
//           );
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         rightTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         topTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             reservedSize: 30,
//             interval: 1,
//             getTitlesWidget: bottomTitleWidgets,
//           ),
//         ),
//         leftTitles: const AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: false,
//             interval: 1,
//             reservedSize: 42,
//           ),
//         ),
//       ),
//       borderData: FlBorderData(
//         show: false,
//         border: Border.all(color: const Color(0xff37434d)),
//       ),
//       minX: 0,
//       maxX: 13,
//       minY: 0,
//       maxY: 6,
//       lineBarsData: [
//         LineChartBarData(
//           spots: const [
//             FlSpot(0, 3),
//             FlSpot(2.6, 2),
//             FlSpot(4.9, 5),
//             FlSpot(6.8, 3.1),
//             FlSpot(8, 4),
//             FlSpot(9.5, 3),
//             FlSpot(11, 4),
//             FlSpot(13, 5),
//             FlSpot(14, 0),
//           ],
//           isCurved: true,
//           gradient: LinearGradient(
//             colors: gradientColors,
//           ),
//           barWidth: 5,
//           isStrokeCapRound: true,
//           dotData: const FlDotData(
//             show: false,
//           ),
//           belowBarData: BarAreaData(
//             show: true,
//             gradient: LinearGradient(
//               colors: gradientColors
//                   .map((color) => color.withOpacity(0.3))
//                   .toList(),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   LineChartData avgData() {
//     return LineChartData(
//       lineTouchData: const LineTouchData(enabled: false),
//       gridData: FlGridData(
//         show: false,
//         drawHorizontalLine: true,
//         verticalInterval: 1,
//         horizontalInterval: 1,
//         getDrawingVerticalLine: (value) {
//           return const FlLine(
//             color: Color(0xff37434d),
//             strokeWidth: 1,
//           );
//         },
//         getDrawingHorizontalLine: (value) {
//           return const FlLine(
//             color: Color(0xff37434d),
//             strokeWidth: 1,
//           );
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             reservedSize: 30,
//             getTitlesWidget: bottomTitleWidgets,
//             interval: 1,
//           ),
//         ),
//         leftTitles: const AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: false,
//             // getTitlesWidget: leftTitleWidgets,
//             reservedSize: 42,
//             interval: 1,
//           ),
//         ),
//         topTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         rightTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//       ),
//       borderData: FlBorderData(
//         show: true,
//         border: Border.all(color: const Color(0xff37434d)),
//       ),
//       minX: 0,
//       maxX: 13,
//       minY: 0,
//       maxY: 6,
//       lineBarsData: [
//         LineChartBarData(
//           spots: const [
//             FlSpot(0, 3.44),
//             FlSpot(2.6, 3.44),
//             FlSpot(4.9, 3.44),
//             FlSpot(6.8, 3.44),
//             FlSpot(8, 3.44),
//             FlSpot(9.5, 3.44),
//             FlSpot(11, 3.44),
//             FlSpot(13, 3.44),
//           ],
//           isCurved: true,
//           gradient: LinearGradient(
//             colors: [
//               ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                   .lerp(0.2)!,
//               ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                   .lerp(0.2)!,
//             ],
//           ),
//           barWidth: 5,
//           isStrokeCapRound: true,
//           dotData: const FlDotData(
//             show: false,
//           ),
//           belowBarData: BarAreaData(
//             show: true,
//             gradient: LinearGradient(
//               colors: [
//                 ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                     .lerp(0.2)!
//                     .withOpacity(0.1),
//                 ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                     .lerp(0.2)!
//                     .withOpacity(0.1),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
