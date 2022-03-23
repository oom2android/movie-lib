import 'package:flutter/material.dart';
import 'package:movie_lib/widgets/back_button.dart';
import 'package:movie_lib/widgets/icon_text.dart';
import 'package:movie_lib/widgets/multistate/multi_state.dart';
import 'package:movie_lib/widgets/video_play.dart';
import 'package:mpcore/mpcore.dart';

class MovieDetailPage extends StatefulWidget {
  MovieDetailPage({Key? key}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  bool isStartPlay = false;

  MultiState _state = MultiState.LOADING;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _state = MultiState.FAIL;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MPScaffold(
      appBar: MPAppBar(
          context: context,
          title: MPText('机器人总动员'),
          leading: BackIcon(
            onTap: () {
              !isStartPlay
                  ? Navigator.of(context).pop()
                  : setState(() {
                      isStartPlay = false;
                    });
            },
          )),
      body: MultiStateView(
        state: _state,
        onRetry: () {
          setState(() {
            _state = MultiState.LOADING;
          });
          Future.delayed(Duration(seconds: 3), () {
            setState(() {
              _state = MultiState.SUCCESS;
            });
          });
        },
        child: CustomScrollView(
          slivers: [
            isStartPlay
                ? SliverToBoxAdapter(
                    child: Container(
                      child: VideoPlay(),
                    ),
                  )
                : SliverToBoxAdapter(
                    child: _buildListItem(),
                  ),
            SliverToBoxAdapter(
              child: _buildIntroduction(),
            ),
            SliverGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.6,
              children: [
                _buildMovieItem(),
                _buildMovieItem(),
                _buildMovieItem(),
                _buildMovieItem(),
                _buildMovieItem(),
                _buildMovieItem(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildMovieItem() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/movie_play');
      },
      child: Container(
        padding: EdgeInsets.all(10),
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
                  padding:
                      EdgeInsets.only(left: 6, top: 2, right: 6, bottom: 2),
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
      ),
    );
  }

  _buildIntroduction() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          IconText(
            text: '简介',
            iconUrl: 'assets/images/icon/ic_desc.png',
          ),
          SizedBox(
            height: 20,
          ),
          MPText(
            '　公元2805年，人类文明高度发展，却因污染和生活垃圾大量增加使得地球不再适于人类居住。地球人被迫乘坐飞船离开故乡，进行一次漫长无边的宇宙之旅。临行前他们委托Buynlarge的公司对地球垃圾进行清理，该公司开发了名为WALL·E（Waste Allocation Loa d Lifters – Earth 地球废品分装员）的机器人担当此重任。',
            style: TextStyle(
              fontSize: 13,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          IconText(
            text: '推荐',
            iconUrl: 'assets/images/icon/ic_hot.png',
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  _buildListItem() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 120,
              height: 160,
              child: Image.network(
                'https://img2.doubanio.com/view/photo/l/public/p1461851991.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  MPText(
                    '机器人总动员 WALL·E (2008)',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      MPText(
                        '2002/美国',
                        style: TextStyle(),
                      ),
                      Spacer(),
                      MPText(
                        '1080P',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  MPText(
                    '导演: 安德鲁·斯坦顿',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  MPText(
                    '公元2805年，人类文明高度发展，却因污染和生活垃圾大量增加使得地球不再适于人类居住。地球人被迫乘坐飞船离开故乡，进行一次漫长无边的宇宙之旅。临行前他们委托Buynlarge的公司对地球垃圾进行清理，该公司开发了名为WALL·E（Waste Allocation Loa d Lifters – Earth 地球废品分装员）的机器人担当此重任',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 30,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.redAccent),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.of(context).pushNamed("/web_view_page");
                              MPWebDialogs.showToast(
                                // or MPWebDialogs.showLoading
                                title: '你好',
                                icon: ToastIcon.success,
                              );
                            },
                            child: MPText(
                              '收藏',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 30,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isStartPlay = true;
                              });
                            },
                            child: MPText(
                              '播放',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
