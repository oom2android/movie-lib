import 'package:flutter/material.dart';
import 'package:mpcore/mpkit/mpkit.dart';

class ColumnDetailPage extends StatefulWidget {
  ColumnDetailPage({Key? key}) : super(key: key);

  @override
  State<ColumnDetailPage> createState() => _ColumnDetailPageState();
}

class _ColumnDetailPageState extends State<ColumnDetailPage> {
  @override
  Widget build(BuildContext context) {
    return MPScaffold(
      appBar: MPAppBar(
        context: context,
        title: MPText('科幻电影'),
      ),
      body: MPReachBottomListener(
        onReachBottom: (_) {},
        child: CustomScrollView(
          primary: true,
          slivers: [
            SliverToBoxAdapter(child: _buildHeader()),
            SliverList(
              delegate: SliverChildBuilderDelegate((content, index) {
                return _buildListItem();
              }, childCount: 10),
            ),
          ],
        ),
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
                  Row(
                    children: [
                      Expanded(
                        child: MPText(
                          '机器人总动员 WALL·E (2008)',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MPText(
                        '1080P',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MPText(
                    '2002/美国',
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MPText(
                    '公元2805年，人类文明高度发展，却因污染和生活垃圾大量增加使得地球不再适于人类居住。地球人被迫乘坐飞船离开故乡，进行一次漫长无边的宇宙之旅。临行前他们委托Buynlarge的公司对地球垃圾进行清理，该公司开发了名为WALL·E（Waste Allocation Loa d Lifters – Earth 地球废品分装员）的机器人担当此重任',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                  Spacer(),
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
                          Navigator.of(context).pushNamed('/movie_detail');
                        },
                        child: MPText(
                          '播放',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildHeader() {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        Image.network(
          'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fb542aea34e958aed5029114c0b1cf0dfa5cba8a941b13-FPO8ms_fw658&refer=http%3A%2F%2Fhbimg.b0.upaiyun.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1649943392&t=aa399230cde4b98a1edf51538250016c',
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 10,
          bottom: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
                color: Colors.black87, borderRadius: BorderRadius.circular(20)),
            child: MPText(
              '共10部',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
                color: Colors.black87, borderRadius: BorderRadius.circular(20)),
            child: MPText(
              '科幻',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]),
    );
  }
}
