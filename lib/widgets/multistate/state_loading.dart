import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';

class StateLoading extends StatelessWidget {
  const StateLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Center(
          child: Container(
        height: 100,
        width: 100,
        alignment: Alignment.center,
        child: Column(
          children: [
            MPCircularProgressIndicator(),
            SizedBox(
              height: 8,
            ),
            Text(
              '加载中..',
              style: TextStyle(fontSize: 12, color: Colors.black),
            )
          ],
        ),
      )),
    );
  }
}
