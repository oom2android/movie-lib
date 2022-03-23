import 'package:flutter/material.dart';
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
    HomePage(),
    CategoryPage(),
    // SearchPage(),
    ColumnPage(),
    ProfilePage(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MPScaffold(
      body: _pages[_currentIndex],
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
            // NavigationBarItem(
            //     selectedIcon: 'assets/images/nav/ic_search.png',
            //     unselectedIcon: 'assets/images/nav/ic_search_.png',
            //     title: "搜索"),
            NavigationBarItem(
                selectedIcon: 'assets/images/nav/ic_find.png',
                unselectedIcon: 'assets/images/nav/ic_find_.png',
                title: "专栏"),
            NavigationBarItem(
                selectedIcon: 'assets/images/nav/ic_profile.png',
                unselectedIcon: 'assets/images/nav/ic_profile_.png',
                title: "我的"),
          ]),
    );
  }
}
