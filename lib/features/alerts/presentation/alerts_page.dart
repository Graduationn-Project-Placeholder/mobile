import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('System & Grid Alerts')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAlertTile(
            'High Load Warning',
            'District 5 transformer node reaching 88% capacity.',
            '10 mins ago',
            Colors.orange,
          ),
          _buildAlertTile(
            'Scheduled Maintenance',
            'Grid branch B-12 undergoing repairs tomorrow 02:00 AM.',
            '1 hour ago',
            AppTheme.midnightGreen,
          ),
          _buildAlertTile(
            'System Normal',
            'All telemetry monitors functioning as expected.',
            '3 hours ago',
            AppTheme.mossGreen,
          ),
        ],
      ),
    );
  }

  Widget _buildAlertTile(String title, String body, String time, Color accent) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 10,
              height: 50,
              decoration: BoxDecoration(color: accent, borderRadius: BorderRadius.circular(4)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: accent, fontSize: 16)),
                      Text(time, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(body, style: const TextStyle(fontSize: 13, color: AppTheme.midnightGreen)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}