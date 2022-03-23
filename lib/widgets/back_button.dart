import 'package:flutter/material.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({Key? key, this.onTap}) : super(key: key);

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        child: Center(
          child: Container(
            width: 18,
            height: 18,
            child: Image.network(
              'https://cdn.jsdelivr.net/gh/mpflutter-plugins/icons@master/arrow_back_ios_new_black_24dp.svg',
              width: 18,
              height: 18,
            ),
          ),
        ),
      ),
    );
  }
}
