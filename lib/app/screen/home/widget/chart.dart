import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:test_fl_chart/app/data/color.dart';
import 'package:test_fl_chart/app/screen/home/controller.dart';

class HomeChart extends StatelessWidget {
  final HomeController hc;
  const HomeChart({super.key, required this.hc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: chartGrey,
      ),
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(show: false),
          titlesData: const FlTitlesData(
            leftTitles: AxisTitles(),
            rightTitles: AxisTitles(),
            topTitles: AxisTitles(),
            bottomTitles: AxisTitles(),
          ),
          maxY: 5,
          minY: 0,
          gridData: const FlGridData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                hc.st.home.dynamics?.length ?? 0,
                (i) =>
                    FlSpot(i.toDouble(), hc.st.home.dynamics?[i].value ?? 0.0),
              ),
              isCurved: true,
              dotData: const FlDotData(show: false),
              color: chartGreen,
              barWidth: 2,
              belowBarData: BarAreaData(
                show: true,
                color: const Color.fromRGBO(105, 177, 55, 0.1),
              ),
              isStrokeCapRound: true,
            ),
          ],
        ),
      ),
    );
  }
}
