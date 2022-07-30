import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../model/add_edit/model/add_edit.dart';

class Chartdata {
  String? categories;
  double? amount;
  Chartdata({required this.categories, required this.amount});
}

class PieChartPov extends ChangeNotifier {
  late TooltipBehavior tooltipBehavior;

  PieChartPov() {
    tooltipBehavior = TooltipBehavior(enable: true);
  }

  List<TransationModel> todayListNotifier = [];

  List<Chartdata> listOfData(List<TransationModel> model) {
    double value;
    CategoryType catagoryname;
    String customCategory = 'Income';
    List duplicateChecking = [];
    List<Chartdata> returnData = [];

    for (var i = 0; i < model.length; i++) {
      duplicateChecking.add(i);
    }

    for (int i = 0; i < model.length; i++) {
      value = model[i].amount;
      catagoryname = model[i].type;

      for (int j = i + 1; j < model.length; j++) {
        if (model[i].type == model[j].type) {
          value = value + model[j].amount;
          duplicateChecking[j] = -1;
        }
      }

      if (catagoryname == CategoryType.income) {
        customCategory = 'Income';
      } else if (catagoryname == CategoryType.expense) {
        customCategory = 'Expense';
      } else if (catagoryname == CategoryType.borrow) {
        customCategory = 'Borrow';
      } else if (catagoryname == CategoryType.lend) {
        customCategory = 'Lend';
      }
      if (duplicateChecking[i] != -1) {
        returnData.add(Chartdata(categories: customCategory, amount: value));
      }
    }

    return returnData;
  }

  // getdata(DateTime selectedmonth) async {
  //   String format = DateFormat('yMMMM').format(selectedmonth);
  //   TransactionData.instance.sortListner.value.clear();
  //   Future.forEach(TransactionData.instance.recentListener.value, (TransationModel element) {
  //     String formatData = DateFormat('yMMMM').format(element.dateTime);
  //     if (format == formatData) {
  //       TransactionData.instance.sortListner.value.add(element);
  //     }
  //     // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
  //     TransactionData.instance.sortListner.notifyListeners();
  //   });
  // }

}
