import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../exception/app_exception.dart';
import 'base_api_service.dart';

class NetworkApiService implements BaseApiServices {
  final Dio _dio = Dio();

  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson;
    try {
      final response = await _dio.get(url).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw NoInternetException('No Internet Connection');
      } else if (e.type ==  DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw FetchDataException('Network Request time out');
      } else {
        rethrow;
      }
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      final response = await _dio.post(url, data: data).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw NoInternetException('No Internet Connection');
      } else if (e.type == DioExceptionType.connectionTimeout) {
        throw FetchDataException('Network Request time out');
      } else {
        rethrow;
      }
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    if (kDebugMode) {
      print(response.statusCode);
    }

    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        return response.data;
      case 401:
        throw BadRequestException(response.data.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.data.toString());
      default:
        throw FetchDataException('Error occurred while communicating with server');
    }
  }
}
