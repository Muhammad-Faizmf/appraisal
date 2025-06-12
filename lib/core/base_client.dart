import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:Appraisal/core/exceptions.dart';
import 'package:Appraisal/core/hive_services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class BaseClient {
  static const int timeduration = 60;

  //GET
  static Future<http.Response> get(String baseUrl, String api) async {
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'Authorization': 'bearearToken ${HiveService.getTokken()}'
    };
    var uri = Uri.parse(baseUrl + api);
    try {
      var response = await http
          .get(uri, headers: requestHeaders)
          .timeout(const Duration(seconds: timeduration));
      return _processResponse(response);
    } on SocketException {
      EasyLoading.showError("Api not responsding...");
      throw FetchDataException(
          message: 'No Internet connection', url: uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          message: 'API not responded in time', url: uri.toString());
    }
  }

  //POST
  static Future<http.Response> post(
      {required String baseUrl,
      required String api,
      Map<String, dynamic>? payloadObj}) async {
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'Authorization': 'bearearToken ${HiveService.getTokken()}'
    };
    var uri = Uri.parse(baseUrl + api);

    try {
      var response = await http
          .post(uri, body: payloadObj, headers: requestHeaders)
          .timeout(const Duration(seconds: timeduration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(
          message: 'No Internet connection', url: uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          message: 'API not responded in time', url: uri.toString());
    }
  }

  //DELETE
  static Future<http.Response> delete(
      String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    try {
      var response = await http
          .delete(uri, body: payload)
          .timeout(const Duration(seconds: timeduration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(
          message: 'No Internet connection', url: uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          message: 'API not responded in time', url: uri.toString());
    }
  }

  static Future<http.Response> login({
    required String baseUrl,
    required String api,
    required Map<String, dynamic> payloadObj,
  }) async {
    var url = Uri.parse(baseUrl + api);
    final response = await http.post(
      url,
      body: payloadObj,
    );

    return response;
  }

  //PUT
  static Future<http.Response> put(
      {required String baseUrl,
      required String api,
      Map<String, dynamic>? payloadObj}) async {
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'Authorization': 'bearearToken ${HiveService.getTokken()}'
    };
    var uri = Uri.parse(baseUrl + api);

    try {
      var response = await http
          .put(uri, body: payloadObj, headers: requestHeaders)
          .timeout(const Duration(seconds: timeduration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(
          message: 'No Internet connection', url: uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          message: 'API not responded in time', url: uri.toString());
    }
  }

  static http.Response _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        Map map = jsonDecode(response.body);
        EasyLoading.showSuccess(map["message"]);
        return response;

      case 201:
        Map map = jsonDecode(response.body);
        EasyLoading.showSuccess(map["message"]);
        return response;

      case 400:
        EasyLoading.showError(
          "Exception 400: Your request couldn’t be processed. Please check your input and try again.",
        );
        throw BadRequestException(
          message: "Bad Request",
          url:
              "Exception 400: Your request couldn’t be processed. Please check your input and try again.",
        );

      case 401:
        EasyLoading.showError(
            "Exception 401: You need to log in to access this page. Please sign in and try again.");
        throw UnAuthorizedException(
          message: "Unauthorized",
          url:
              "Exception 401: You need to log in to access this page. Please sign in and try again.",
        );

      case 403:
        EasyLoading.showError(
          "Exception 403: You don’t have permission to access this resource. Please contact your administrator if you believe this is an error.",
        );
        throw ForbiddenException(
          "Forbidden",
          "Exception 403: You don’t have permission to access this resource. Please contact your administrator if you believe this is an error.",
        );

      case 404:
        EasyLoading.showError(
          "Exception 404: The page or resource you’re looking for doesn’t exist. Please check the URL or go back to the homepage.",
        );
        throw Exception404(
          "Not Found",
          "Exception 404: The page or resource you’re looking for doesn’t exist. Please check the URL or go back to the homepage.",
        );

      case 405:
        EasyLoading.showError(
          "Exception 405: The action you’re trying to perform isn’t allowed. Please try a different action or contact support.",
        );
        throw MethodNotAllowedException(
          "Method Not Allowed",
          "Exception 405: The action you’re trying to perform isn’t allowed. Please try a different action or contact support.",
        );

      case 408:
        EasyLoading.showError(
          "Exception 408: Your request took too long to process. Please check your internet connection and try again.",
        );
        throw RequestTimeoutException(
          "Request Timeout",
          "Exception 408: Your request took too long to process. Please check your internet connection and try again.",
        );

      case 409:
        Map map = jsonDecode(response.body);
        EasyLoading.showError(map["message"]);
        throw UnAuthorizedException(
          message: "Duplicate Date",
          url: map["message"],
        );

      case 422:
        Map map = jsonDecode(response.body);
        EasyLoading.showError(map["message"]);
        throw BadRequestException(
          message: "Bad Request",
          url: map["message"],
        );

      case 429:
        EasyLoading.showError(
          "Exception 429: You’ve made too many requests. Please wait a few minutes and try again.",
        );
        throw TooManyRequestsException(
          "Too Many Requests",
          "Exception 429: You’ve made too many requests. Please wait a few minutes and try again.",
        );

      case 500:
        Map map = jsonDecode(response.body);
        EasyLoading.showError(map["message"]);
        throw BadRequestException(
          message: "Bad Request",
          url: map["message"],
        );

      case 502:
        EasyLoading.showError(
          "Exception 502: We’re experiencing a temporary issue. Please try again in a few minutes.",
        );
        throw BadGatewayException(
          "Bad Gateway",
          "Exception 502: We’re experiencing a temporary issue. Please try again in a few minutes.",
        );

      case 503:
        EasyLoading.showError(
          "Exception 503: Our services are temporarily unavailable. We’re working to fix the issue. Please try again later.",
        );
        throw ServiceUnavailableException(
          "Service Unavailable",
          "Exception 503: Our services are temporarily unavailable. We’re working to fix the issue. Please try again later.",
        );

      case 504:
        EasyLoading.showError(
          "Exception 504: Our servers are taking too long to respond. Please check your internet connection and try again.",
        );
        throw GatewayTimeoutException(
          "Gateway Timeout",
          "Exception 504: Our servers are taking too long to respond. Please check your internet connection and try again.",
        );

      default:
        Map map = jsonDecode(response.body);
        EasyLoading.showInfo(map["message"]);
        throw FetchDataException(
          message: 'No Internet connection',
          url: response.request!.url.toString(),
        );
    }
  }
}
