import 'package:flutter_riverpod/flutter_riverpod.dart';

// Current active locale (en / ar)
final localeProvider = StateProvider<String>((ref) => 'ar');

// Global Auth State
final authStateProvider = StateProvider<bool>((ref) => false);