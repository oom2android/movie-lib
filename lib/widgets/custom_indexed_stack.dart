import 'package:flutter/material.dart';

class CustomIndexedStack extends StatelessWidget {
  List<Widget> children;
  int? index;

  CustomIndexedStack({
    Key? key,
    required this.children,
    this.index = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    items.addAll(children);
    return Stack(children: items);
  }
}
