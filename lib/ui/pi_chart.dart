import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartPage extends StatefulWidget {
  const PieChartPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChartPageState();
}

class PieChartPageState extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) => Card(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: IndicatorsWidget(),
                ),
              ],
            ),
            Expanded(
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    // touchCallback: (FlTouchEvent, pieTouchResponse) {
                    //   setState(() {
                    //     if (pieTouchResponse?.touchedSection
                    //             is FlLongPressEnd ||
                    //         pieTouchResponse?.touchedSection is FlPanEndEvent) {
                    //       touchedIndex = -1;
                    //     } else {
                    //       var touchedSectionIndex;
                    //       //   touchedIndex = pieTouchResponse.touchedSectionIndex;
                    //     }
                    //   });
                    // },
                  ),
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: getSections(touchedIndex),
                ),
              ),
            ),
          ],
        ),
      );
}

class IndicatorsWidget extends StatelessWidget {
  const IndicatorsWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: PieData.data
            .map(
              (data) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: buildIndicator(
                    color: data.color,
                    text: data.name,
                     isSquare: true,
                  )),
            )
            .toList(),
      );

  Widget buildIndicator({
    required Color color,
    required String text,
    bool isSquare = false,
    double size = 16,
    Color textColor = const Color(0xff505050),
  }) =>
      Row(
        children: <Widget>[
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
              color: color,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          )
        ],
      );
}

List<PieChartSectionData> getSections(int touchedIndex) => PieData.data
    .asMap()
    .map<int, PieChartSectionData>((index, data) {
      final isTouched = index == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 100 : 80;


      final value = PieChartSectionData(
        color: data.color,
        value: data.percent,
        title: '${data.percent}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
      );

      return MapEntry(index, value);
    })
    .values
    .toList();
// [
// PieChartSectionData(title: "Blue",color: Colors.blueGrey,titleStyle: const TextStyle(color: Colors.white),),
// PieChartSectionData(title: "Orange",color: Colors.pinkAccent,titleStyle: const TextStyle(color: Colors.white)),
// PieChartSectionData(title: "White",color: Colors.deepOrangeAccent,titleStyle: const TextStyle(color: Colors.white)),
// PieChartSectionData(title: "Pink",color: Colors.orange,titleStyle: const TextStyle(color: Colors.white)),
// ] ,

// class PieData {
//   static List<PieChartDataModal> data = [
//     PieChartDataModal(name: "Blue", percent: 40, color: Colors.pinkAccent),
//     PieChartDataModal(name: "Blue", percent: 30, color: Colors.deepOrangeAccent),
//     PieChartDataModal(name: "Blue", percent: 15, color: Colors.deepPurpleAccent),
//     PieChartDataModal(name: "Blue", percent: 15, color: Colors.purpleAccent),
//   ];
// }

class PieData {
  static List<Data> data = [
    Data(name: 'Blue', percent: 40, color: const Color(0xff0293ee)),
    Data(name: 'Orange', percent: 30, color: const Color(0xfff8b250)),
    Data(name: 'Black', percent: 15, color: Colors.black),
    Data(name: 'Green', percent: 15, color: const Color(0xff13d38e)),
  ];
}

class Data {
  final String name;

  final double percent;

  final Color color;

  Data({required this.name, required this.percent, required this.color});
}
