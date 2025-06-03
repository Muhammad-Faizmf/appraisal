import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  AppException([this.message, this.prefix, this.url]);
}

class FetchDataException extends AppException {
  @override
  // ignore: overridden_fields
  final String? message, url;
  FetchDataException({required this.message, this.url});
  @override
  String toString() {
    EasyLoading.showError(message!);
    return "$message: $url";
  }
}

class BadRequestException extends AppException {
  @override
  // ignore: overridden_fields
  final String? message, url;
  BadRequestException({required this.message, this.url});
  @override
  String toString() {
    EasyLoading.showError(message!);
    return "$message: $url";
  }
}

class ApiNotRespondingException extends AppException {
  @override
  // ignore: overridden_fields
  final String? message, url;
  ApiNotRespondingException({required this.message, this.url});
  @override
  String toString() {
    EasyLoading.showError(message!);
    return "$message: $url";
  }
}

class UnAuthorizedException extends AppException {
  @override
  // ignore: overridden_fields
  final String? message, url;
  UnAuthorizedException({required this.message, this.url});
  @override
  String toString() {
    EasyLoading.showError(message!);
    return "$message: $url";
  }
}

class DuplicateException extends AppException {
  @override
  // ignore: overridden_fields
  final String? message, url;
  DuplicateException([this.message, this.url]);

  @override
  String toString() {
    EasyLoading.showError(message!);
    return "$message: $url";
  }
}

class ForbiddenException extends AppException {
  @override
  // ignore: overridden_fields
  final String? message, url;

  ForbiddenException([this.message, this.url]);

  @override
  String toString() {
    EasyLoading.showError(message!);
    return "$message: $url";
  }
}

class Exception404 extends AppException {
  @override
  // ignore: overridden_fields
  final String? message, url;
  Exception404([this.message, this.url]);

  @override
  String toString() {
    EasyLoading.showError(message!);
    return "$message: $url";
  }
}

class MethodNotAllowedException extends AppException {
  @override
  // ignore: overridden_fields
  final String? message, url;

  MethodNotAllowedException([this.message, this.url]);

  @override
  String toString() {
    EasyLoading.showError(message!);
    return "$message: $url";
  }
}

class RequestTimeoutException extends AppException {
  @override
  // ignore: overridden_fields
  final String? message, url;

  RequestTimeoutException([this.message, this.url]);

  @override
  String toString() {
    EasyLoading.showError(message!);
    return "$message: $url";
  }
}

class TooManyRequestsException extends AppException {
  @override
  // ignore: overridden_fields
  final String? message, url;

  TooManyRequestsException([this.message, this.url]);

  @override
  String toString() {
    EasyLoading.showError(message!);
    return "$message: $url";
  }
}

class InternalServerErrorException extends AppException {
  @override
  // ignore: overridden_fields
  final String? message, url;

  InternalServerErrorException([this.message, this.url]);

  @override
  String toString() {
    EasyLoading.showError(message!);
    return "$message: $url";
  }
}

class BadGatewayException extends AppException {
  @override
  // ignore: overridden_fields
  final String? message, url;

  BadGatewayException([this.message, this.url]);

  @override
  String toString() {
    EasyLoading.showError(message!);
    return "$message: $url";
  }
}

class ServiceUnavailableException extends AppException {
  @override
  // ignore: overridden_fields
  final String? message, url;

  ServiceUnavailableException([this.message, this.url]);

  @override
  String toString() {
    EasyLoading.showError(message!);
    return "$message: $url";
  }
}

class GatewayTimeoutException extends AppException {
  @override
  // ignore: overridden_fields
  final String? message, url;

  GatewayTimeoutException([this.message, this.url]);

  @override
  String toString() {
    EasyLoading.showError(message!);
    return "$message: $url";
  }
}

class ClientException extends AppException {
  @override
  // ignore: overridden_fields
  final String? message, url;

  ClientException([this.message, this.url]);

  @override
  String toString() {
    EasyLoading.showError(message!);
    return "$message: $url";
  }
}
