class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException(this.message, [this.statusCode]);

  @override
  String toString() => 'AppException: $message (Code: ${statusCode ?? 'N/A'})';
}

class NetworkException extends AppException {
  NetworkException([String message = 'No Internet connection or server unreachable'])
      : super(message, 503);
}

class AuthException extends AppException {
  AuthException([String message = 'Unauthorized access']) : super(message, 401);
}