import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mpcore/mpkit/mpkit.dart';

class BannerSwiper extends StatefulWidget {
  final double? height;
  final bool loop;
  final SwiperPaginatio? indicator;
  final int initialPage;
  final bool autoPlay;
  final Duration duration;

  final List<Widget> items;
  ValueChanged<int>? onTap;

  BannerSwiper(
      {Key? key,
      this.height = 160.0,
      this.loop = false,
      required this.items,
      this.onTap,
      this.indicator,
      this.initialPage = 0,
      this.autoPlay = false,
      this.duration = const Duration(seconds: 4)})
      : super(key: key);

  @override
  State<BannerSwiper> createState() => _BannerSwiperState();
}

class _BannerSwiperState extends State<BannerSwiper> {
  late final MPPageController _controller;
  late final Timer _timer;
  late int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          MPPageView(
            controller: _controller,
            loop: widget.loop,
            children: _buildPage(),
          ),
          Container(
            margin: widget.indicator?.margin ?? EdgeInsets.only(bottom: 10),
            alignment: widget.indicator?.alignment ?? Alignment.bottomCenter,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: _buildIndicator(),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = MPPageController(initialPage: widget.initialPage);
    _controller.addListener(() {
      setState(() {
        _currentIndex = _controller.page;
      });
    });

    if (widget.autoPlay && widget.items.length > 1) {
      _setTimer();
    }
  }

  _setTimer() {
    _timer = Timer.periodic(widget.duration, (timer) {
      _currentIndex = _currentIndex + 1;
      if (_currentIndex >= _pages.length) {
        _currentIndex = 0;
      }
      _controller.animateToPage(_currentIndex,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    });
  }

  List<Widget> _indicators = [];
  List<Widget> _buildIndicator() {
    _indicators.clear();
    for (var i = 0; i < widget.items.length; i++) {
      _indicators.add(
        Padding(
          padding: EdgeInsets.only(right: widget.indicator?.builder.space ?? 2),
          child: Container(
            decoration: BoxDecoration(
                color: i == _currentIndex
                    ? widget.indicator?.builder.activeColor
                    : widget.indicator?.builder.color,
                borderRadius: BorderRadius.circular(
                    (widget.indicator?.builder.size ?? 6) / 2.0)),
            width: widget.indicator?.builder.size,
            height: widget.indicator?.builder.size,
          ),
        ),
      );
    }

    return _indicators;
  }

  List<Widget> _pages = [];
  List<Widget> _buildPage() {
    _pages.clear();
    for (var i = 0; i < widget.items.length; i++) {
      _pages.add(GestureDetector(
        onTap: () {
          widget.onTap!(_currentIndex);
        },
        child: widget.items[i],
      ));
    }
    return _pages;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class SwiperPaginatio {
  final Alignment alignment;
  final EdgeInsets? margin;
  final DotSwiperPaginationBuilder builder;

  SwiperPaginatio(
      {this.alignment = Alignment.bottomCenter,
      this.margin,
      required this.builder});
}

class DotSwiperPaginationBuilder {
  final double space;
  final double size;

  final double activeSize;
  final Color color;
  final Color activeColor;

  DotSwiperPaginationBuilder(
      {this.space = 2,
      this.size = 6,
      this.activeSize = 8,
      this.color = Colors.black54,
      this.activeColor = Colors.white});
}
