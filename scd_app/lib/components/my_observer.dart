import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'my_error.dart';

// ignore: must_be_immutable
class MyObserver extends StatelessWidget {
  List<ObservableFuture Function()> futures;
  final ObservableFuture Function() future;
  final Function() onRetry;
  final WidgetBuilder builder;

  MyObserver({Key key, String name, this.futures, @required this.builder, @required this.onRetry, this.future}) {
    assert(future != null || futures != null);
    if (futures == null) {
      futures = [future];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      var pending = futures.any((future) => future()?.status == FutureStatus.pending);
      var rejected = futures.any((future) => future()?.status == FutureStatus.rejected);
      var fulfilled = futures.every((future) => future()?.status == FutureStatus.fulfilled);
      if (pending) {
        return Center(child: CircularProgressIndicator());
      } else if (rejected) {
        futures.forEach((e) => print(e().error));
        return MyError(
          onRetryPressed: onRetry,
        );
      } else if (fulfilled) {
        return builder(context);
      } else {
        return SizedBox.shrink();
      }
    });
  }
}
