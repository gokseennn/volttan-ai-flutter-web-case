import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:voltran_ai_web/services/api_service/model/api_interceptor.dart';

export 'package:dio/dio.dart';

enum HttpMethod { get, post, put, delete, patch }

extension ResponseExtension on Response {
  bool get isOk => (statusCode ?? 0) >= 200 && (statusCode ?? 0) < 300;
}

class ApiService extends GetxService {
  final Dio _client = Dio();
  final List<ApiInterceptor> _interceptors = [];
  late final Widget? _loadingWidget;
  final _loadingCount = 0.obs;
  bool _loadingShowing = false;

  ApiService({
    required Duration requestTimeout,
    Duration? responseTimeout,
    Widget? loadingWidget,
  }) {
    _client.options.connectTimeout = requestTimeout;
    _client.options.receiveTimeout = responseTimeout;
    _loadingWidget = loadingWidget;
    _loadingCount.addListener(() {
      if (_loadingCount.value > 0 && !_loadingShowing) {
        _loadingShowing = true;
        Get.dialog(
          Center(child: _loadingWidget ?? const CircularProgressIndicator()),
          barrierDismissible: false,
        );
      }
      if (_loadingCount.value == 0 && _loadingShowing) {
        _loadingShowing = false;
        Get.close(closeDialog: true, closeAll: false);
      }
    });
  }

  static ApiService get to => Get.find<ApiService>();

  Future<Response<T>> request<T>({
    required HttpMethod method,
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    String? contentType = Headers.jsonContentType,
    ResponseType? responseType = ResponseType.json,
    bool? showLoading,
    bool? showError,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
    Duration? timeout,
    Map<String, dynamic>? headers,
  }) async {
    if (showLoading ?? false) {
      _loadingCount.value++;
    }

    try {
      final response = await _client.request<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          responseType: responseType,
          method: method.name.toUpperCase(),
          sendTimeout: timeout,
          receiveTimeout: timeout,
          headers: headers,
          contentType: contentType,
        ),
      );

      if ((showLoading ?? false) && _loadingCount.value > 0) {
        _loadingCount.value--;
      }
      return response;
    } catch (e) {
      if ((showLoading ?? false) && _loadingCount.value > 0) {
        _loadingCount.value--;
      }
      if (showError ?? false) {
        if (e is DioException) {
          var message = e.response?.data is String
              ? e.response?.data
              : e.response?.data?['error_description'] ??
                    e.response?.data?['message'] ??
                    e.response?.data.toString();
          final statusCode = e.response?.statusCode;
          if ((statusCode == 401 || statusCode == 403) && message == null ||
              '$message'.isEmpty) {
            message = 'NOT_HAVE_PERMISSION'.tr;
          }
          //TODO error dialog
        }
      }
      return Response<T>(
        requestOptions: RequestOptions(path: path),
        statusCode: e is DioException ? e.response?.statusCode : 500,
        statusMessage: e is DioException
            ? e.response?.statusMessage
            : e.toString(),
        data: e is DioException ? e.response?.data : null,
      );
    }
  }

  void addInterceptor(ApiInterceptor interceptor) {
    _interceptors.add(interceptor);
    _client.interceptors.add(interceptor.interceptor);
    Get.log('Interceptor added with name: "${interceptor.name}"');
  }

  void removeInterceptor(String name) {
    ApiInterceptor? found;
    for (final interceptor in _interceptors) {
      if (interceptor.name == name) {
        found = interceptor;
        break;
      }
    }
    if (found != null) {
      _interceptors.remove(found);
      _client.interceptors.remove(found.interceptor);
    } else {
      Get.log('Interceptor not found with name: "$name"', isError: true);
    }
  }

  Map<String, dynamic> removeNullValues(Map<String, dynamic> map) {
    return map..removeWhere((key, value) => value == null);
  }
}
