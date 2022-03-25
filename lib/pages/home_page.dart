import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_lib/config/config.dart';
import 'package:movie_lib/http/core/http_client.dart';
import 'package:movie_lib/widgets/banner_swiper.dart';
import 'package:movie_lib/widgets/multistate/multi_state.dart';
import 'package:movie_lib/widgets/search_botton.dart';
import 'package:mpcore/mpcore.dart';

import '../utils/log_utils.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  late MultiState _multiState = MultiState.SUCCESS;

  Map<String, dynamic> mBanners = {};

  dynamic mData;

  @override
  void initState() {
    super.initState();

    // getBanner();
  }

  getBanner() {
    setState(() {
      _multiState = MultiState.SUCCESS;
    });

    Future.delayed(Duration(seconds: 1), () {
      HttpClient().get(
          url: 'v1/movies/banner',
          successCallback: (data) {
            mData = data;
            setState(() {
              _multiState = MultiState.SUCCESS;
            });

            LogUtil.d(data.toString());
          },
          errorCallback: (code, msg) {
            LogUtil.e(msg);
            setState(() {
              _multiState = MultiState.FAIL;
            });
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MPScaffold(
        backgroundColor: KColor.bg_color,
        body: Column(
          children: [
            MPAppBar(
                context: context,
                leading: SearchButton(
                  onTap: () {
                    Navigator.of(context).pushNamed('/search_page');
                  },
                )),
            Expanded(
              child: MultiStateView(
                  state: _multiState,
                  child: MPRefreshIndicator(
                    onRefresh: (key) async {
                      print('start refresh');
                      await Future.delayed(Duration(seconds: 5));
                      print('end refresh');
                    },
                    enableChecker: (key) {
                      return key is ValueKey && key.value == 'home_page';
                    },
                    child: ListView(
                      key: Key('home_page'),
                      shrinkWrap: true,
                      children: [
                        _buildBanner(),
                        _buildCategory(),
                        SizedBox(
                          height: 10,
                        ),
                        _buildMovieGird(),
                        _buildMovieGird(),
                      ],
                    ),
                  )),
            )
          ],
        ));
  }

  _buildCategory() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: KColor.white_color, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: _buildCategoryItem("电影", "assets/images/icon/ic_movie.png"),
          ),
          Expanded(
            child: _buildCategoryItem("电视剧", "assets/images/icon/ic_dsj.png"),
          ),
          Expanded(
            child: _buildCategoryItem("动漫", "assets/images/icon/ic_dm.png"),
          ),
          Expanded(
            child: _buildCategoryItem("排行", "assets/images/icon/ic_rank.png"),
          ),
        ],
      ),
    );
  }

  _buildCategoryItem(title, iconUrl) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            iconUrl,
            height: 32,
            width: 32,
          ),
          MPText(
            title,
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }

  _buildMovieGird() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: KColor.white_color,
      ),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              MPText(
                '热门电影',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  _gotoCategoryListPage();
                },
                child: MPText(
                  '更多',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GridView.builder(
              shrinkWrap: true,
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.6),
              itemBuilder: (BuildContext context, int index) {
                return _buildMovieItem();
              }),
        ],
      ),
    );
  }

  _gotoCategoryListPage() {
    Navigator.of(context)
        .pushNamed('/category_list', arguments: {'title': '热门电影'});
  }

  _buildMovieItem() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/movie_detail');
      },
      child: Column(children: [
        Expanded(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://img2.doubanio.com/view/photo/l/public/p1461851991.jpg',
                  ))),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 6, top: 2, right: 6, bottom: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Colors.red),
                child: MPText(
                  '9.0',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: MPText(
                    '1080P',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ))
            ],
          ),
        )),
        SizedBox(
          height: 4,
        ),
        MPText(
          '机器人总动员',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 12, color: Colors.black, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 4,
        ),
      ]),
    );
  }

  List<Widget> _buildBaners() {
    List<Widget> data = [];

    if (mData == null || mData.length == 0) {
      return [];
    }

    for (var i = 0; i < mData.length; i++) {
      LogUtil.d(mData[i]['cover']);
      data.add(Stack(
        children: [
          Image.network(
            mData[i]['cover'],
            scale: 0.5,
            fit: BoxFit.cover,
          ),
          Image.network(
            mData[i]['cover'],
          ),
        ],
      ));
    }

    return data;
  }

  _buildBanner() {
    return BannerSwiper(
      autoPlay: true,
      indicator: SwiperPaginatio(
        builder: DotSwiperPaginationBuilder(),
        alignment: Alignment.bottomCenter,
      ),
      onTap: (index) {
        Navigator.of(context).pushNamed('/movie_detail');
      },
      loop: true,
      items: [
        // _buildBaners(),
        Stack(
          children: [
            Image.network(
              'https://imgdb.cc/view/photo/s_ratio_poster/public/p2670448229.jpg',
              scale: 0.5,
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://imgdb.cc/view/photo/s_ratio_poster/public/p2670448229.jpg',
            ),
          ],
        ),
        // _buildBaners(),
        Stack(
          children: [
            Image.network(
              'https://imgdb.cc/view/photo/s_ratio_poster/public/p2640388705.jpg',
              scale: 0.5,
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://imgdb.cc/view/photo/s_ratio_poster/public/p2640388705.jpg',
            ),
          ],
        ),
        // _buildBaners(),
        Stack(
          children: [
            Image.network(
              'https://imgdb.cc/view/photo/s_ratio_poster/public/p2749431335.jpg',
              scale: 0.5,
              fit: BoxFit.cover,
            ),
            Image.network(
              'https://imgdb.cc/view/photo/s_ratio_poster/public/p2749431335.jpg',
            ),
          ],
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
