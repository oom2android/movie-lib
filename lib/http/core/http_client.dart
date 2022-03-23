import 'package:dio/dio.dart';

import 'http_core.dart';
import 'http_dio.dart';

typedef HttpSuccessCallback<T> = void Function(dynamic data);

typedef HttpFailureCallback = void Function(int code, String error);

typedef JsonParse<T> = T Function(dynamic data);

class HttpClient {
  final Map<String, CancelToken> _cancelTokens = <String, CancelToken>{};
  late HttpDio _client;

  static const String GET = 'get';
  static const String POST = 'post';

  static final HttpClient _instance = HttpClient._internal();

  factory HttpClient() => _instance;

  HttpClient._internal() {
    _client = HttpDio();
  }

  void init({required HttpConfig config}) {
    _client.options = BaseOptions(
      baseUrl: config.baseUrl,
      connectTimeout: config.connectTimeout,
      receiveTimeout: config.receiveTimeout,
    );

    if (config.interceptors != null) {
      _client.interceptors.addAll(config.interceptors ?? []);
    }
  }

  ///GET请求
  void get({
    required String url,
    Map<String, dynamic>? params,
    Options? options,
    HttpTransformer? httpTransformer,
    required HttpSuccessCallback successCallback,
    required HttpFailureCallback errorCallback,
    String? tag,
  }) async {
    _request(
      url: url,
      data: params,
      method: GET,
      httpTransformer: httpTransformer,
      successCallback: successCallback,
      errorCallback: errorCallback,
      tag: tag ?? url,
    );
  }

  ///POST 请求
  void post({
    required String url,
    data,
    Options? options,
    required HttpSuccessCallback successCallback,
    required HttpFailureCallback errorCallback,
    String? tag,
  }) async {
    _request(
      url: url,
      data: data,
      method: POST,
      successCallback: successCallback,
      errorCallback: errorCallback,
      tag: tag ?? url,
    );
  }

  void _request({
    required String url,
    required String method,
    data,
    Map<String, dynamic>? params,
    Options? options,
    HttpTransformer? httpTransformer,
    HttpSuccessCallback? successCallback,
    HttpFailureCallback? errorCallback,
    required String tag,
  }) async {
    // ConnectivityResult connectivityResult =
    //     await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.none) {
    //   if (errorCallback != null) {
    //     // errorCallback(HttpError(HttpError.NETWORK_ERROR, "网络异常，请稍后重试！"));
    //   }
    //   return;
    // }

    //设置默认值
    params = params ?? {};

    options?.method = method;

    options = options ??
        Options(
          method: method,
        );

    url = _restfulUrl(url, params);

    try {
      CancelToken? cancelToken = _cancelTokens[tag];
      if (cancelToken != null) {
        _cancelTokens[tag] = cancelToken;
      }

      Response<Map<String, dynamic>> response = await _client.request(url,
          data: data,
          queryParameters: params,
          options: options,
          cancelToken: cancelToken);

      HttpResponse httpResponse =
          handleResponse(response, httpTransformer: httpTransformer);

      if (httpResponse.ok) {
        //成功
        if (successCallback != null) {
          successCallback(httpResponse.data);
        }
      } else {
        if (errorCallback != null) {
          errorCallback(httpResponse.error!.code, httpResponse.error!.message);
        }
      }
    } on Exception catch (e, s) {
      if (errorCallback != null) {
        HttpResponse response = handleException(e);
        errorCallback(response.error!.code, response.error!.message);
      }
    }
  }

  String _restfulUrl(String url, Map<String, dynamic> params) {
    params.forEach((key, value) {
      if (url.contains(key)) {
        url = url.replaceAll(':$key', value.toString());
      }
    });
    return url;
  }

  void download({
    required String url,
    required savePath,
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? params,
    data,
    Options? options,
    HttpSuccessCallback? successCallback,
    HttpFailureCallback? errorCallback,
    String? tag,
  }) async {
    int receiveTimeout = 0;

    options == null
        ? Options(receiveTimeout: receiveTimeout)
        : options.receiveTimeout = receiveTimeout;

    params = params ?? {};
    tag = tag ?? url;

    url = _restfulUrl(url, params);

    try {
      CancelToken? cancelToken = _cancelTokens[tag];
      if (cancelToken != null) {
        _cancelTokens[tag] = cancelToken;
      }

      Response response = await _client.download(url, savePath,
          onReceiveProgress: onReceiveProgress,
          queryParameters: params,
          data: data,
          options: options,
          cancelToken: cancelToken);

      HttpResponse httpResponse = handleResponse(response);

      if (httpResponse.ok) {
        if (successCallback != null) {
          successCallback(httpResponse.data);
        }
      } else {
        if (errorCallback != null) {
          errorCallback(httpResponse.error!.code, httpResponse.error!.message);
        }
      }
    } on Exception catch (e, s) {
      if (errorCallback != null) {
        HttpResponse response = handleException(e);
        errorCallback(response.error!.code, response.error!.message);
      }
    }
  }

  void upload({
    required String url,
    required FormData data,
    ProgressCallback? onSendProgress,
    Map<String, dynamic>? params,
    Options? options,
    HttpSuccessCallback? successCallback,
    HttpFailureCallback? errorCallback,
    String? tag,
  }) async {
    params = params ?? {};
    tag = tag ?? url;

    options?.method = POST;

    options = options ??
        Options(
          method: POST,
        );

    url = _restfulUrl(url, params);

    try {
      CancelToken? cancelToken = _cancelTokens[tag];
      if (cancelToken != null) {
        _cancelTokens[tag] = cancelToken;
      }

      Response<Map<String, dynamic>> response = await _client.request(url,
          onSendProgress: onSendProgress,
          data: data,
          queryParameters: params,
          options: options,
          cancelToken: cancelToken);

      HttpResponse httpResponse = handleResponse(response);

      if (httpResponse.ok) {
        if (successCallback != null) {
          successCallback(httpResponse.data);
        }
      } else {
        if (errorCallback != null) {
          errorCallback(httpResponse.error!.code, httpResponse.error!.message);
        }
      }
    } on Exception catch (e, s) {
      if (errorCallback != null) {
        HttpResponse response = handleException(e);
        errorCallback(response.error!.code, response.error!.message);
      }
    }
  }

  ///取消网络请求
  void cancel(String tag) {
    if (_cancelTokens.containsKey(tag)) {
      if (!_cancelTokens[tag]!.isCancelled) {
        _cancelTokens[tag]!.cancel();
      }
      _cancelTokens.remove(tag);
    }
  }
}
