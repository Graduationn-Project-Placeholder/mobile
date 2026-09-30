import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/login_page.dart';

void main() {
  runApp(const SmartGovApp());
}

class SmartGovApp extends StatelessWidget {
  const SmartGovApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartGov Platform',
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}