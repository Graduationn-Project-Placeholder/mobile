import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';

class TelemetryPage extends ConsumerWidget {
  const TelemetryPage({super.key});

  int _calculateTier(double kWh) {
    if (kWh <= 50) return 1;
    if (kWh <= 100) return 2;
    if (kWh <= 200) return 3;
    if (kWh <= 350) return 4;
    if (kWh <= 650) return 5;
    if (kWh <= 1000) return 6;
    return 7;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double currentUsage = 245.8; // Mock kWh read from ESP32/PZEM-004T
    final int currentTier = _calculateTier(currentUsage);

    return Scaffold(
      appBar: AppBar(title: const Text('Energy Telemetry')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Summary Card
            Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Monthly Usage', style: TextStyle(color: AppTheme.midnightGreen)),
                        Text('$currentUsage kWh', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.darkGreen)),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: currentTier > 4 ? Colors.amber[100] : AppTheme.mossGreen.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text('Tier $currentTier (1–7)', style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.darkGreen)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Daily Consumption (kWh)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.darkGreen)),
            const SizedBox(height: 16),

            // Telemetry Chart
            SizedBox(
              height: 250,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true),
                  titlesData: const FlTitlesData(show: true),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(1, 8.2),
                        FlSpot(2, 10.5),
                        FlSpot(3, 7.8),
                        FlSpot(4, 12.1),
                        FlSpot(5, 9.4),
                        FlSpot(6, 14.0),
                        FlSpot(7, 11.2),
                      ],
                      isCurved: true,
                      color: AppTheme.darkGreen,
                      barWidth: 4,
                      belowBarData: BarAreaData(show: true, color: AppTheme.mossGreen.withOpacity(0.3)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}