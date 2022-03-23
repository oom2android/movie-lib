import 'package:flutter/material.dart';
import 'package:movie_lib/widgets/search_bar.dart';
import 'package:mpcore/mpcore.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _controller = TextEditingController();
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return MPScaffold(
        appBar: MPAppBar(context: context, title: SearchBar()),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MPText(
                      '热搜',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      spacing: 10,
                      runSpacing: 5,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          child: MPText(
                            '青春变形记',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          child: MPText(
                            '狼 Wolf',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          child: MPText(
                            '亚当计划 The Adam Project',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
