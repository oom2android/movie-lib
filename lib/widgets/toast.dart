import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';

class Toast extends StatefulWidget {
  Toast({Key? key}) : super(key: key);

  @override
  State<Toast> createState() => _ToastState();
}

class _ToastState extends State<Toast> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MPMiniProgramView(
        tag: 'wx.showToast',
        attributes: {
          'title': 'userAvatarUrl',
        },
      ),
    );
  }
}
