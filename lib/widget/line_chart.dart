import 'package:embarcados/models/measure/MeasureModel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'line_chart_data.dart';

class LineChartContent extends StatelessWidget {

  final List<MeasureModel> measures;

  const LineChartContent({super.key, required this.measures});


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
        lineBarsData: generateSpots(),
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

  List<LineChartBarData> generateSpots(){
    List<FlSpot> spots = [];
    for(var i = 0; i < measures.length; i++){
      spots.add(FlSpot(i+1, measures.elementAt(i).temperature));
    }
    return [
      LineChartBarData(
        color: lineColor,
        isCurved: false,
        spots: spots
    )
    ];
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String text;
    if(value.toInt() > measures.length){
      print("Excedeu: $value");
      return Container();
    }
    text = DateFormat("dd/MM/yyyy hh:mm:ss").format((measures.elementAt(value.toInt()-1)).created);

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