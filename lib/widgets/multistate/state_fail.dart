import 'package:flutter/material.dart';

class StateFail extends StatelessWidget {
  final VoidCallback? onRetry;

  const StateFail({Key? key, this.onRetry}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          child: Column(
            children: [
              GestureDetector(
                onTap: onRetry,
                child: Container(
                  width: 60,
                  height: 60,
                  child: Image.asset(
                    'assets/images/icon/ic_loading_fail.png',
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '加载失败,点击重试',
                style: TextStyle(fontSize: 12, color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
