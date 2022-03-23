import 'package:dio/dio.dart';
import 'package:movie_lib/utils/log_utils.dart';

void log2Console(Object object) {
  LogUtil.v(object);
}

/// @desc  自定义日志拦截器
///@time 2019/3/18 9:15 AM
/// @author Cheney
class CustomLogInterceptor extends Interceptor {
  CustomLogInterceptor({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = true,
    this.responseHeader = true,
    this.responseBody = true,
    this.error = true,
    this.logPrint = log2Console,
  });

  /// Print request [Options]
  bool request;

  /// Print request header [Options.headers]
  bool requestHeader;

  /// Print request data [Options.data]
  bool requestBody;

  /// Print [Response.data]
  bool responseBody;

  /// Print [Response.headers]
  bool responseHeader;

  /// Print error message
  bool error;

  /// Log printer; defaults print log to console.
  /// In flutter, you'd better use debugPrint.
  /// you can also write log in a file, for example:
  ///```dart
  ///  var file=File("./log.txt");
  ///  var sink=file.openWrite();
  ///  dio.interceptors.add(LogInterceptor(logPrint: sink.writeln));
  ///  ...
  ///  await sink.close();
  ///```
  void Function(Object object) logPrint;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logPrint('*** Request ***');
    printKV('uri', options.uri);

    if (request) {
      printKV('method', options.method);
      printKV('responseType', options.responseType.toString());
      printKV('followRedirects', options.followRedirects);
      printKV('connectTimeout', options.connectTimeout);
      printKV('receiveTimeout', options.receiveTimeout);
      printKV('extra', options.extra);
    }
    if (requestHeader) {
      logPrint('headers:');
      options.headers.forEach((key, v) => printKV(" $key", v));
    }
    if (requestBody) {
      logPrint("data:");
      printAll(options.data);
    }
    logPrint("");
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (error) {
      logPrint('*** DioError ***:');
      logPrint("uri: ${err.response}");
      logPrint("$err");
      Response? response = err.response;
      if (response != null) {
        _printResponse(response);
      }
      logPrint("");
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logPrint("*** Response ***");
    _printResponse(response);
  }

  void _printResponse(Response response) {
    printKV('uri', response.redirects);
    if (responseHeader) {
      printKV('statusCode', response.statusCode.toString());
      if (response.isRedirect == true) {
        printKV('redirect', response.realUri);
      }
      if (response.headers != null) {
        logPrint("headers:");
        response.headers.forEach((key, v) => printKV(" $key", v.join(",")));
      }
    }
    if (responseBody) {
      logPrint("Response Text:");
      printAll(response.toString());
    }
    logPrint("");
  }

  printKV(String key, Object v) {
    logPrint('$key: $v');
  }

  printAll(msg) {
    msg.toString().split("\n").forEach(logPrint);
  }
}
