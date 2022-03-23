import 'package:flutter/material.dart';
import 'package:movie_lib/config/config.dart';
import 'package:movie_lib/widgets/category_tag.dart';
import 'package:mpcore/mpcore.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final List<String> categorys = [
    '全部',
    '剧情',
    '喜剧',
    '动作',
    '爱情',
    '惊悚',
    '犯罪',
    '悬疑',
    '战争',
    '科幻',
    '动画',
    '恐怖',
    '武侠',
    '运动',
  ];
  final List<String> areas = [
    '全部',
    '内地',
    '中国香港',
    '美国',
    '欧洲',
    '中国台湾',
    '日本',
    '韩国',
    '英国',
    '法国',
    '德国',
  ];
  final List<String> years = [
    '全部',
    '2022',
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
    '2016',
  ];

  final editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MPScaffold(
      backgroundColor: KColor.bg_color,
      appBar: MPAppBar(context: context),
      body: Column(children: [
        _buildSelectCategory(),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            decoration: BoxDecoration(
                color: KColor.white_color,
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.6,
              ),
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return _buildMovieItem();
              },
            ),
          ),
        ),
      ]),
    );
  }

  _buildSelectCategory() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: KColor.white_color, borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.center,
                child: MPText(
                  '类型',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: KColor.black_color,
                      fontSize: 14),
                )),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.center,
                child: MPText(
                  '地区',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: KColor.black_color,
                      fontSize: 14),
                )),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.center,
                child: MPText(
                  '年代',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: KColor.black_color,
                      fontSize: 14),
                )),
          ),
        ],
      ),
    );
  }

  _buildMovieItem() {
    return GestureDetector(
      onTap: () {},
      child: Container(
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

  _buildHeader() {
    return Container(
      height: 130,
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: ListView(
        shrinkWrap: true,
        children: [
          CategoryTag(items: categorys),
          SizedBox(
            height: 6,
          ),
          CategoryTag(
            items: areas,
            selectedColor: Colors.deepOrange,
          ),
          SizedBox(
            height: 4,
          ),
          CategoryTag(
            items: years,
            selectedColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
