import 'package:flutter/material.dart';
import 'package:movie_lib/widgets/my_indexed_stack.dart';
import 'package:movie_lib/widgets/navigation_bar.dart';
import 'package:mpcore/mpkit/mpkit.dart';

import 'category_page.dart';
import 'column_page.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'search_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(
      key: Key('1'),
    ),
    CategoryPage(
      key: Key('2'),
    ),
    // SearchPage(),
    ColumnPage(
      key: Key('3'),
    ),
    ProfilePage(
      key: Key('4'),
    ),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MPScaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Visibility(
            maintainState: true,
            visible: _currentIndex == 0,
            child: HomePage(),
          ),
          Visibility(
            maintainState: true,
            visible: _currentIndex == 1,
            child: CategoryPage(),
          ),
          Visibility(
            maintainState: true,
            visible: _currentIndex == 2,
            child: ProfilePage(),
          ),
        ],
      ),
      bottomBar: NavigationBar(
          onSelectedIndex: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: [
            NavigationBarItem(
                selectedIcon: 'assets/images/nav/ic_home.png',
                unselectedIcon: 'assets/images/nav/ic_home_.png',
                title: "精选"),
            NavigationBarItem(
                selectedIcon: 'assets/images/nav/ic_category.png',
                unselectedIcon: 'assets/images/nav/ic_category_.png',
                title: "分类"),
            NavigationBarItem(
                selectedIcon: 'assets/images/nav/ic_profile.png',
                unselectedIcon: 'assets/images/nav/ic_profile_.png',
                title: "我的"),
          ]),
    );
  }
}
