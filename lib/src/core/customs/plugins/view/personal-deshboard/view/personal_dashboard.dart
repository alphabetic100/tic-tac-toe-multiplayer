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
        maxX: 10,
        minY: 0,
        maxY: 10,
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
        backgroundColor: MyColors.slateBlue.withOpacity(0.5),
        lineBarsData: [
          LineChartBarData(
              isCurved: true,
              color: MyColors.vividBlue,
              spots: [
                const FlSpot(0, 0),
                const FlSpot(1, 1),
                const FlSpot(2, 2),
                const FlSpot(3, 3),
                const FlSpot(4, 4),
              ],
              belowBarData: BarAreaData(
                show: true,
                color: MyColors.vividBlue.withOpacity(0.5),
              )),
        ],
        titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  return Text(value.toString().split(".")[0]);
                },
              ),
            ),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text(value.toString().split(".")[0]);
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
