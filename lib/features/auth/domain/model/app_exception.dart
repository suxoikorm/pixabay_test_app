class AppException implements Exception {
  AppException([this.message = 'An unknown error occurred']);

  final String message;

  @override
  String toString() {
    return message;
  }
}
