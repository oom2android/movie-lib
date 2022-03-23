import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';

class NavigationBarItem {
  final String selectedIcon;
  final String unselectedIcon;
  final String? title;
  NavigationBarItem(
      {required this.selectedIcon, required this.unselectedIcon, this.title});
}

class NavigationBar extends StatefulWidget {
  int? currentIndex;
  ValueChanged<int>? onSelectedIndex;
  double height;
  double iconSize;
  Color selectedColor;
  Color unselectedColor;
  Color backgroudColor;
  List<NavigationBarItem> items;
  NavigationBar({
    Key? key,
    this.currentIndex = 0,
    this.onSelectedIndex,
    this.height = 50,
    this.iconSize = 24,
    this.selectedColor = Colors.black,
    this.unselectedColor = Colors.grey,
    this.backgroudColor = Colors.white,
    required this.items,
  }) : super(key: key);

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      color: widget.backgroudColor,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: _buildNavigation(),
      ),
    );
  }

  List<Widget> _buildNavigation() {
    List<Widget> navitations = [];
    navitations.clear();

    for (var i = 0; i < widget.items.length; i++) {
      navitations.add(GestureDetector(
        onTap: () {
          widget.currentIndex = i;
          if (widget.onSelectedIndex != null) {
            widget.onSelectedIndex!(i);
          }
        },
        child: _buildNavigationBarItem(
            i,
            i == widget.currentIndex
                ? widget.items[i].selectedIcon
                : widget.items[i].unselectedIcon,
            widget.iconSize,
            widget.selectedColor,
            widget.unselectedColor,
            widget.items[i].title),
      ));
    }
    return navitations;
  }

  _buildNavigationBarItem(index, String iconUrl, double iconSize,
      Color selectedColor, Color unselectedColor, String? title) {
    return Expanded(
      child: Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: iconSize,
                width: iconSize,
                child: Image.asset(
                  iconUrl,
                ),
              ),
              title == ""
                  ? Container()
                  : MPText(
                      title ?? "",
                      style: TextStyle(
                        fontSize: 12,
                        color: widget.currentIndex == index
                            ? selectedColor
                            : unselectedColor,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
