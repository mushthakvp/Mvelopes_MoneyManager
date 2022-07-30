import 'package:flutter/cupertino.dart';

import '../../view/widgets/home_listview.dart';

class ViewMorePov extends ChangeNotifier {
  int index = 0;
  navigationChange(int index) {
    this.index = index;
    appBarName(index: index);

    notifyListeners();
  }

  String appBarName({required int index}) {
    switch (index) {
      case 3:
        return 'Lend';
      case 1:
        return 'Expense';
      case 2:
        return 'Borrow';
      default:
        return 'Income';
    }
  }

  final bodyIndex = [
    const HomeListView(
      idx: 0,
      checkLength: false,
    ),
    const HomeListView(
      idx: 1,
      checkLength: false,
    ),
    const HomeListView(
      idx: 2,
      checkLength: false,
    ),
    const HomeListView(
      idx: 3,
      checkLength: false,
    )
  ];
}
