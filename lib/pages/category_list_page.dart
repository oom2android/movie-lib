import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';

class CategoryListPage extends StatefulWidget {
  CategoryListPage({Key? key}) : super(key: key);

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    return MPScaffold(
      backgroundColor: Color.fromARGB(255, 248, 247, 247),
      appBar: MPAppBar(
        context: context,
        title: MPText(arguments?['title'] ?? ''),
      ),
      body: MPRefreshIndicator(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Image.network(
                    "https://img1.doubanio.com/view/photo/l/public/p2512331919.jpg",
                    scale: 0.5,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    "https://img1.doubanio.com/view/photo/l/public/p2512331919.jpg",
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((content, index) {
              return _buildListItem();
            }, childCount: 20),
          )
        ],
      )),
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
                          '?????????????????? WALL??E (2008)',
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
                    '2002/??????',
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MPText(
                    '??????2805????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????Buynlarge???????????????????????????????????????????????????????????????WALL??E???Waste Allocation Loa d Lifters ??? Earth ???????????????????????????????????????????????????',
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
                          '??????',
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
}
