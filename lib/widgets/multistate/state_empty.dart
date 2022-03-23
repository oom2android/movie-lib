import 'package:flutter/material.dart';

class StateEmpty extends StatelessWidget {
  final VoidCallback? onRetry;

  const StateEmpty({Key? key, this.onRetry}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: GestureDetector(
          onTap: onRetry,
          child: Container(
            width: 100,
            height: 100,
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  child: Image.asset(
                    'assets/images/icon/ic_empty.png',
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '暂无数据,点击重试',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
