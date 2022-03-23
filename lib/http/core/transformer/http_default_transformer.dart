import 'package:dio/dio.dart';

import '../http_core.dart';

class HttpDefaultTransformer extends HttpTransformer {
  @override
  HttpResponse parse(Response response) {
    if (response.data["code"] == 200) {
      return HttpResponse.success(response.data["data"]);
    } else {
      return HttpResponse.failure(
          errorMsg: response.data["msg"], errorCode: response.data["code"]);
    }
  }

  static final HttpDefaultTransformer _instance =
      HttpDefaultTransformer._internal();

  HttpDefaultTransformer._internal();

  factory HttpDefaultTransformer.getInstance() => _instance;
}
