import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_multiplayer/src/core/utils/colors/my_colors.dart';

class PersonalDashboard extends StatelessWidget {
  const PersonalDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 19,
        minY: 0,
        maxY: 6,
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) {
            return const FlLine(
              color: MyColors.slateBlue,
              strokeWidth: 1,
            );
          },
          drawVerticalLine: true,
          getDrawingVerticalLine: (value) {
            return const FlLine(
              color: MyColors.slateBlue,
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(show: true, border: Border.all()
            // border: const Border(
            //   left: BorderSide(
            //     color: MyColors.slateBlue,
            //     width: 1,
            //   ),
            //   bottom: BorderSide(
            //     color: MyColors.slateBlue,
            //     width: 1,
            //   ),
            //   top: BorderSide.none,
            //   right: BorderSide.none,
            // ),
            ),
        backgroundColor: MyColors.lightGrey,
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: MyColors.vividBlue,
            spots: [
              const FlSpot(0, 0),
              const FlSpot(5, 1),
              const FlSpot(10, 2),
              const FlSpot(15, 3),
              const FlSpot(19, 4),
            ],
          ),
        ],
        titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Text(value.toString()[0]);
                },
              ),
            ),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text(
                    value.toString().substring(0, 2).replaceAll(".", ""));
              },
            )),
            rightTitles: const AxisTitles(
                sideTitles: SideTitles(
              showTitles: false,
            )),
            topTitles: const AxisTitles(
                sideTitles: SideTitles(
              showTitles: false,
            ))),
      ),
    );
  }
}
