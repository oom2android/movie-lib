import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback? onTap;

  const SearchButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/nav/ic_search.png',
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
