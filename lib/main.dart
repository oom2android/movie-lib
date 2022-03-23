import 'package:flutter/widgets.dart';
import 'package:movie_lib/pages/search_page.dart';
import 'package:movie_lib/pages/web_view_page.dart';
import 'package:movie_lib/utils/log_utils.dart';
import 'package:mpcore/mpcore.dart';

import 'http/core/http_client.dart';
import 'http/core/http_core.dart';
import 'pages/category_list_page.dart';
import 'pages/column_detail_page.dart';
import 'pages/login/login_page.dart';
import 'pages/main_page.dart';
import 'pages/movie_detail_page.dart';

void main() {
  HttpClient().init(
      config: HttpConfig(
    baseUrl: 'http://localhost:8000/api/',
  ));
  LogUtil.init(isDebug: true);

  runApp(MyApp());
  MPCore().connectToHostChannel();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MPApp(
      title: 'Movie',
      color: Colors.blue,
      routes: {
        '/': (context) => MainPage(),
        '/login': (context) => LoginPage(),
        '/category_list': (context) => CategoryListPage(),
        '/movie_detail': (context) => MovieDetailPage(),
        '/column_detail': (context) => ColumnDetailPage(),
        '/search_page': (context) => SearchPage(),
        '/web_view_page': (context) => WebViewPage(),
      },
      navigatorObservers: [MPCore.getNavigationObserver()],
    );
  }
}
