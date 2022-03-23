import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';

class VideoPlay extends StatefulWidget {
  VideoPlay({Key? key}) : super(key: key);

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  late final MPVideoController _controller;
  @override
  void initState() {
    super.initState();
    _controller = MPVideoController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: MPVideoView(
        controller: _controller,
        url: 'https://v2.xw0371.com/20180401/wiyCDyE3/index.m3u8',
      ),
    );
  }

  @override
  void dispose() {
    _controller.pause();
    super.dispose();
  }
}
