import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        margin: EdgeInsets.only(left: 50, right: 120),
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 10),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 218, 216, 216),
              borderRadius: BorderRadius.circular(20)),
          height: 35,
          child: MPEditableText(
            focusNode: FocusNode(),
            style: TextStyle(fontSize: 12, color: Colors.black),
            placeholder: '搜索',
            onSubmitted: (value) {},
            controller: _controller,
          ),
        ));
  }
}
