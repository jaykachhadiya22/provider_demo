import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'dart:math';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({Key? key}) : super(key: key);

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 101,
            ),
            AspectRatio(
              aspectRatio: 1,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 18,
                    left: 12,
                    top: 24,
                    bottom: 12,
                  ),
                  child: LineChart(
                    mainData(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10';
        break;
      case 3:
        text = '30';
        break;
      case 5:
        text = '50';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      // lineTouchData: LineTouchData(
      //     getTouchedSpotIndicator: (LineChartBarData, List<int> a) {
      //       return a.toList()
      //     }
      // ),
      // lineTouchData: LineTouchData(
      //     touchTooltipData: LineTouchTooltipData(
      //       getTooltipItems: (value) {
      //         return value
      //             .map((e) => LineTooltipItem("${value[0].bar}",
      //             TextStyle(color: Colors.purpleAccent)))
      //             .toList();
      //       },
      //       tooltipBgColor: Colors.white54,
      //     )
      // ),

      // lineTouchData: LineTouchData(
      //     enabled: true,
      //     touchTooltipData: LineTouchTooltipData(
      //       tooltipBgColor: Colors.blue,
      //       tooltipRoundedRadius: 20.0,
      //       fitInsideHorizontally: true,
      //       tooltipMargin: 0,
      //
      //       //   getTooltipItems: (touchedSpots) {
      //       // return touchedSpots.map(
      //       //       (LineBarSpot touchedSpot) {
      //       //     const textStyle = TextStyle(
      //       //       fontSize: 10,
      //       //       fontWeight: FontWeight.w700,
      //       //       color: Colors.white,
      //       //     );
      //
      //       //     return LineTooltipItem(
      //       //       points[touchedSpot.spotIndex].y.toStringAsFixed(2),
      //       //       textStyle,
      //       //     );
      //       //   },
      //       // ).toList();
      //       //  },
      //     )),

      clipData: FlClipData.all(),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 0,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.black12,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          //  axisNameWidget: Text("Hello Word"),
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.merge(
              const Border(left: BorderSide(color: Colors.black, width: 1)),
              const Border(bottom: BorderSide(color: Colors.black, width: 1)))),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,

      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0.5, 4),
            FlSpot(2.6, 3),
            FlSpot(2.7, 3.3),
            FlSpot(2.7, 4.5),
            FlSpot(6.8, 4.1),
            FlSpot(8, 5),
            FlSpot(9.5, 4),
          ],
          isCurved: false,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
              show: true,
              getDotPainter: (FlSpot, double, LineChartBarData, int) {
                return FlDotCirclePainter(
                  radius: 3.5,
                  color: Colors.white,
                  strokeWidth: 1,
                  strokeColor: Colors.blue,
                );
              }),
        ),
        LineChartBarData(
          spots: const [
            FlSpot(0.8, 2),
            FlSpot(2.6, 1),
            FlSpot(4.9, 3),
            FlSpot(6.8, 2.2),
            FlSpot(8, 3),
            FlSpot(9.5, 1),
          ],
          isCurved: false,
          // gradient: LinearGradient(
          //   colors: gradientColors,
          // ),
          barWidth: 2,
          color: Colors.black,
          // isStrokeCapRound: true,
          // curveSmoothness: 12,
          // isStepLineChart: true,
          // lineChartStepData: LineChartStepData(stepDirection: 0),
          // showingIndicators: [
          //   12,10,5,7,9
          // ],
          // preventCurveOvershootingThreshold: 1,
          // dashArray: [
          //   1,2,3,4,5,6,7
          // ],
          // show: true,
          // isStrokeJoinRound: true,

          dotData: FlDotData(
              show: true,
              getDotPainter: (FlSpot, double, LineChartBarData, int) {
                return FlDotCirclePainter(
                  radius: 3.5,
                  color: Colors.white,
                  strokeWidth: 1,
                  strokeColor: Colors.black,
                );
              }),
          // belowBarData: BarAreaData(
          //   show: true,
          //   gradient: LinearGradient(
          //     colors: gradientColors
          //         .map((color) => color.withOpacity(0.3))
          //         .toList(),
          //   ),
          // ),
        ),
      ],
    );
  }
}




