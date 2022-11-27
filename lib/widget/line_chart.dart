import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'line_chart_data.dart';

class LineChartContent extends StatelessWidget {
  const LineChartContent({super.key});


  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(
          border: const Border(
            top: BorderSide(width: 0,color: Colors.white),
            bottom: BorderSide(width: 1),
            left: BorderSide(width: 1),
            right: BorderSide(width: 0, color: Colors.white)
          )
        ),
        lineBarsData: lineChartBarData,
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: bottomTitleWidgets,
              reservedSize: 160
            ),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false),
          ),
        ),
        gridData: FlGridData(
          show: false,
          drawVerticalLine: false,
          horizontalInterval: 1,
          checkToShowHorizontalLine: (double value) {
            return false;
          },
        ),
      )
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.black, fontSize: 12);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text('${value + 0.5}', style: style),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '01/01/2022 01:01:01';
        break;
      case 1:
        text = '01/01/2022 01:02:01';
        break;
      case 2:
        text = '01/01/2022 01:03:01';
        break;
      case 3:
        text = '01/01/2022 01:04:01';
        break;
      case 4:
        text = '01/01/2022 01:05:01';
        break;
      case 5:
        text = '01/01/2022 01:06:01';
        break;
      case 6:
        text = '01/01/2022 01:07:01';
        break;
      case 7:
        text = '01/01/2022 01:08:01';
        break;
      case 8:
        text = '01/01/2022 01:09:01';
        break;
      case 9:
        text = '01/01/2022 01:10:01';
        break;
      case 10:
        text = '01/01/2022 01:11:01';
        break;
      case 11:
        text = '01/01/2022 01:12:01';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: RotatedBox(
          quarterTurns: 1,
          child: Text(text)
      ),
    );
  }
}