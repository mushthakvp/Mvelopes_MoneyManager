import 'package:flutter/cupertino.dart';

class TapBarPov extends ChangeNotifier {
  int index = 4;
  changeTapBar({required int index}) {
    this.index = index;
    notifyListeners();
  }
}
