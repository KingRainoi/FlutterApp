import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PingDownTimeChart extends StatelessWidget {
  final List<double> pingTimeData;
  final List<double> downTimeData;

  const PingDownTimeChart({
    super.key,
    required this.pingTimeData,
    required this.downTimeData,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: _generateSpots(pingTimeData),
            isCurved: true,
            colors: [Colors.green],
            barWidth: 4,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(show: false),
          ),
          LineChartBarData(
            spots: _generateSpots(downTimeData),
            isCurved: true,
            colors: [Colors.red],
            barWidth: 4,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(show: false),
          ),
        ],
        minX: 0,
        maxX: (pingTimeData.length - 1).toDouble(),
        minY: 0,
        maxY: 10, // Ajusta esto según tus datos para el eje Y
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(showTitles: false),
          leftTitles: SideTitles(showTitles: true),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey),
        ),
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          drawVerticalLine: true,
        ),
      ),
      swapAnimationDuration: const Duration(milliseconds: 150),
      swapAnimationCurve: Curves.linear,
    );
  }

  List<FlSpot> _generateSpots(List<double> data) {
    return data.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value);
    }).toList();
  }
}
