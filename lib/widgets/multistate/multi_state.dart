import 'package:flutter/material.dart';

import 'state_empty.dart';
import 'state_fail.dart';
import 'state_loading.dart';

///多状态布局
class MultiStateView extends StatefulWidget {
  final Widget child;
  final MultiState state;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget? failWidget;

  final VoidCallback? onRetry;

  MultiStateView(
      {Key? key,
      required this.child,
      this.state = MultiState.LOADING,
      this.loadingWidget,
      this.emptyWidget,
      this.failWidget,
      this.onRetry})
      : super(key: key);

  @override
  _MultiStateViewState createState() => _MultiStateViewState();
}

class _MultiStateViewState extends State<MultiStateView> {
  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];
    widgets.add(widget.child);
    Widget? w;

    switch (widget.state) {
      case MultiState.LOADING:
        w = widget.loadingWidget ?? StateLoading();
        widgets.add(w);
        break;
      case MultiState.FAIL:
        w = widget.failWidget ??
            StateFail(
              onRetry: widget.onRetry,
            );
        widgets.add(w);
        break;
      case MultiState.EMPTY:
        w = widget.emptyWidget ??
            StateEmpty(
              onRetry: widget.onRetry,
            );
        widgets.add(w);
        break;
      case MultiState.SUCCESS:
        break;
    }

    return Stack(children: widgets);
  }
}

enum MultiState { LOADING, FAIL, EMPTY, SUCCESS }
