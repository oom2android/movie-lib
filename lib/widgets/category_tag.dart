import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';

class CategoryTag extends StatefulWidget {
  final List<String> items;

  final Color selectedColor;
  CategoryTag({
    Key? key,
    required this.items,
    this.selectedColor = Colors.black,
  }) : super(key: key);

  @override
  State<CategoryTag> createState() => _CategoryTagState();
}

class _CategoryTagState extends State<CategoryTag> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: double.infinity,
      child: ListView.builder(
          itemCount: widget.items.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int position) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = position;
                });
              },
              child: Container(
                  margin: EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _selectedIndex == position
                          ? widget.selectedColor
                          : Colors.black38),
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                  child: MPText(
                    widget.items[position],
                    style: TextStyle(
                        fontSize: 10,
                        color: _selectedIndex == position
                            ? Colors.white
                            : Colors.white),
                  )),
            );
          }),
    );
  }
}
