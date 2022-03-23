import 'package:flutter/material.dart';
import 'package:movie_lib/widgets/icon_text.dart';
import 'package:mpcore/mpcore.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return MPScaffold(
      body: MPRefreshIndicator(
        onRefresh: (key) async {
          print('start refresh');
          await Future.delayed(Duration(seconds: 5));
          print('end refresh');
        },
        enableChecker: (key) {
          return key is ValueKey && key.value == 'profile_page';
        },
        child: CustomScrollView(
          key: Key('profile_page'),
          slivers: [
            SliverToBoxAdapter(
              child: _buildHeader(),
            ),
            SliverToBoxAdapter(
              child: _buildProfile(),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: IconText(
                  iconUrl: 'assets/images/icon/ic_desc.png',
                  text: '收藏',
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(12.0),
              sliver: SliverWaterfall(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    height: 200 + index % 5 * 20,
                    child: _buildMovieItem(),
                  );
                }, childCount: 10),
                gridDelegate: SliverWaterfallDelegate(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
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

  _buildHeader() {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        'https://t7.baidu.com/it/u=2869268957,1721811479&fm=193&f=GIF',
        fit: BoxFit.cover,
      ),
    );
  }

  _buildProfile() {
    return Container(
      height: 200,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic_source%2Fc7%2F8a%2F03%2Fc78a030abf9940543004b4fea7ef3902.jpeg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1649993377&t=6fa7110facf8b74f2729bbe5e020fffb',
                  width: 80,
                  fit: BoxFit.cover,
                  height: 80,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MPText(
                    '亚当计划',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MPText(
                    '一名飞行员穿越时空，与年轻的自己',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
