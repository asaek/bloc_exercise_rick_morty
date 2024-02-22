class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
}

class GeneralException implements Exception {
  final String message;
  GeneralException(this.message);
}
