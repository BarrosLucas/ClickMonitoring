import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Color lineColor = const Color(0xff4587F4);

List<LineChartBarData> lineChartBarData = [
  LineChartBarData(
      color: lineColor,
      isCurved: false,
      spots: const [
        FlSpot(0, 4),
        FlSpot(1, 3.5),
        FlSpot(2, 4.5),
        FlSpot(3, 1),
        FlSpot(4, 4),
        FlSpot(5, 6),
        FlSpot(6, 6.5),
        FlSpot(7, 6),
        FlSpot(8, 4),
        FlSpot(9, 6),
        FlSpot(10, 6),
        FlSpot(11, 7),
      ],
  )
];