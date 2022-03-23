import 'package:dio/dio.dart';

import '../http_core.dart';



/// Response 解析
abstract class HttpTransformer {
  HttpResponse parse(Response response);
}





