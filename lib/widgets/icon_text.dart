import 'package:flutter/widgets.dart';
import 'package:mpcore/mpcore.dart';

class IconText extends StatelessWidget {
  final String? iconUrl;
  final String text;
  final double? iconSize;

  final TextStyle style;

  const IconText(
      {Key? key,
      this.iconUrl,
      required this.text,
      this.iconSize = 24,
      this.style = const TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          iconUrl != ""
              ? Image.asset(
                  iconUrl ?? "",
                  width: 24,
                  height: 24,
                )
              : Container(),
          iconUrl != ""
              ? SizedBox(
                  width: 10,
                )
              : Container(),
          MPText(text, style: style)
        ],
      ),
    );
  }
}
