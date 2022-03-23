import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';

class ColumnPage extends StatefulWidget {
  ColumnPage({Key? key}) : super(key: key);

  @override
  State<ColumnPage> createState() => _ColumnPageState();
}

class _ColumnPageState extends State<ColumnPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return MPScaffold(
      appBar: MPAppBar(context: context),
      body: MPRefreshIndicator(
          onRefresh: (key) async {
            print('start refresh');
            await Future.delayed(Duration(seconds: 5));
            print('end refresh');
          },
          enableChecker: (key) {
            return key is ValueKey && key.value == 'column_page';
          },
          child: ListView.builder(
              key: Key('column_page'),
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/column_detail');
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://img0.baidu.com/it/u=756441544,997827661&fm=253&fmt=auto&app=138&f=JPEG?w=658&h=321'))),
                    child: Center(
                      child: MPText(
                        '科幻电影',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              })),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
