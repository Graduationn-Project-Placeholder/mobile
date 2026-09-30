import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // TODO (Backend Team): Update with live endpoint URL
  static const String baseUrl = 'https://api.smartgov.eg/v1';

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    // TODO (Backend Team): Replace mock with live HTTP request
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt_token', 'mock_jwt_token_123');
    return true;
  }

  Future<bool> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    // TODO (Backend Team): Replace mock with live HTTP request
    return true;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt_token');
  }
}