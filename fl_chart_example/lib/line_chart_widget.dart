import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({Key? key}) : super(key: key);
  final int averagePrice = 12;
  @override
  _LineChartWidgetState createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("fl_chart EXAMPLE")),
        body: Stack(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                    color: Color.fromARGB(255, 0, 0, 0)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 18.0, left: 12.0, top: 24, bottom: 12),
                  child: LineChart(mainData()),
                ),
              ),
            ),
          ],
        ));
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
      space: 8.0,
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
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Color.fromARGB(255, 248, 0, 0),
            strokeWidth: 2,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Color.fromARGB(255, 0, 140, 255),
            strokeWidth: 5,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true),
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
          border:
              Border.all(color: Color.fromARGB(255, 252, 2, 160), width: 10)),
      minX: 0,
      maxX: 11.99,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        //FlSpot(x???, y???)
        LineChartBarData(
          spots: const [
            FlSpot(0, 1.2),
            FlSpot(1, 5.9),
            FlSpot(2, 2.5),
            FlSpot(3, 4.4),
            FlSpot(4, 3.8),
            FlSpot(5, 2.5),
          ],

          // ????????? ??????
          isCurved: false,
          color: Color.fromARGB(222, 34, 255, 4),
          // gradient: LinearGradient(
          //   colors: widget.averagePrice > 200
          //       ? [const Color.fromARGB(222, 3, 4, 5), const Color(0xff67727d)]
          //       : [
          //           Color.fromARGB(222, 255, 0, 55),
          //           Color.fromARGB(255, 255, 221, 3)
          //         ],
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          // ),
          barWidth: 2,
          isStrokeCapRound: false,
          dotData: FlDotData(
            show: false,
          ),
          // ????????? ?????????
          belowBarData: BarAreaData(
            show: false,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        LineChartBarData(
          spots: const [
            FlSpot(5, 2.5),
            FlSpot(6, 2),
            FlSpot(7, 2),
            FlSpot(8, 5),
            FlSpot(9, 3.1),
            FlSpot(10, 4),
            FlSpot(11, 3),
            FlSpot(12, 1),
          ],
          color: Color.fromARGB(222, 255, 4, 4),
          barWidth: 2,
          isStrokeCapRound: false,
          dotData: FlDotData(
            show: false,
          ),
        ),
      ],
      // ?????? ?????? ?????? ??????
      // lineTouchData: LineTouchData(touchCallback:
      //     (FlTouchEvent? event, LineTouchResponse? touchResponse) {
      //   print(touchResponse.toString());
      //   print(event?.isInterestedForInteractions);
      // }),
      // ?????? ????????? LineChartBarData??? area ??????
      // betweenBarsData: [
      //   BetweenBarsData(
      //       fromIndex: 0, toIndex: 1, color: const Color(0xff37434d))
      // ],
    );
  }
}
