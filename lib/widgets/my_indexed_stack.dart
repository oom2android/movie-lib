import 'package:flutter/material.dart';
import 'package:movie_lib/pages/category_page.dart';
import 'package:movie_lib/pages/column_page.dart';
import 'package:movie_lib/pages/home_page.dart';
import 'package:movie_lib/pages/profile_page.dart';

class MyIndexedStack extends StatelessWidget {
  final int index;
  MyIndexedStack({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          maintainState: true,
          visible: index == 0,
          child: HomePage(),
        ),
        Visibility(
          maintainState: true,
          visible: index == 1,
          child: CategoryPage(),
        ),
        Visibility(
          maintainState: true,
          visible: index == 2,
          child: ColumnPage(),
        ),
        Visibility(
          maintainState: true,
          visible: index == 3,
          child: ProfilePage(),
        ),
      ],
    );
  }
}
