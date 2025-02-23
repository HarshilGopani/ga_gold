// coverage:ignore-file
/// A network exception to catch network related errors.
class NetworkException implements Exception {
  /// [message] : A message for the exception.
  /// [statusCode] : An error code to see the status.
  NetworkException({
    required this.message,
    this.statusCode = 502,
  });

  String message;
  int? statusCode;

  @override
  String toString() => '$statusCode: $message';
}
