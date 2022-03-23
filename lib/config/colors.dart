import 'package:flutter/material.dart';

class KColor {
  static Color bg_color = hexToColor("#f6f6f8");
  static Color white_color = Colors.white;
  static Color black_color = Colors.black;

  static Color hexToColor(String s) {
    if (s.length != 7 || int.tryParse(s.substring(1, 7), radix: 16) == null) {
      s = '#FFFFFF';
    }

    return new Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
