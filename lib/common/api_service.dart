import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:peepapp/screens/splash/controller/login_controller.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('REQUEST[${options.method}] => PATH: ${options.path}');
    options.headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer ${LoginController.userToken}",
    };
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) {
    log('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    // log(err.response!.data.toString());
    super.onError(err, handler);
    return Future.value(err);
  }
}

const String url =
    "http://ec2-3-110-202-121.ap-south-1.compute.amazonaws.com/api/";

class ApiService {
  static late final Dio _dio;
  ApiService() {
    _dio = Dio();
    _dio.interceptors.add(
      CustomInterceptors(),
    );
  }

  static Future apiDelegate({
    required String reqMethod,
    required String endPoint,
    dynamic queryStringParams,
    dynamic payload,
  }) {
    log(jsonEncode(payload));
    switch (reqMethod) {
      case "POST":
        return _dio.post(
          url + endPoint,
          data: jsonEncode(payload),
        );
      case "GET":
        return _dio.get(
          url + endPoint,
          data: jsonEncode(payload),
        );
      default:
        return Future.value();
    }
  }
}
