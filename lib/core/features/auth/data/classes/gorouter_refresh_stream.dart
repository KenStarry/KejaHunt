import 'dart:async';

import 'package:flutter/material.dart';

class GorouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription _streamSubscription;

  GorouterRefreshStream(Stream stream) {
    _streamSubscription = stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
