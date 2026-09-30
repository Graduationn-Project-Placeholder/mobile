import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class EthicsPage extends StatelessWidget {
  const EthicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ethics & Gamification')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProgressHeader(),
          const SizedBox(height: 20),
          const Text('Available Training Modules', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.darkGreen)),
          const SizedBox(height: 12),
          _buildModuleTile('Grid Integrity 101', 'Completed', Icons.check_circle, AppTheme.mossGreen),
          _buildModuleTile('Anti-Corruption Principles', 'In Progress (60%)', Icons.timelapse, AppTheme.midnightGreen),
          _buildModuleTile('Energy Conservation Laws', 'Locked', Icons.lock_outline, Colors.grey),
        ],
      ),
    );
  }

  Widget _buildProgressHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.darkGreen,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ethics Score', style: TextStyle(color: AppTheme.beige, fontSize: 14)),
              Text('850 XP', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
            ],
          ),
          Icon(Icons.workspace_premium, size: 48, color: AppTheme.beige),
        ],
      ),
    );
  }

  Widget _buildModuleTile(String title, String status, IconData icon, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: color, size: 30),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(status),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}