import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvelopes/view/pie_chart/pie_chart_screen.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../model/add_edit/model/add_edit.dart';
import '../add_edit/hive_impl.dart';

class Chartdata {
  String? categories;
  double? amount;
  Chartdata({required this.categories, required this.amount});
}

class PieChartPov extends ChangeNotifier {
  late TooltipBehavior tooltipBehavior;

  List<Chartdata> chartData = [];

  PieChartPov() {
    ChartScreen().demoFunction();
    chartData = listOfData(todayListNotifier);
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

  DateTime selectedmonth = DateTime.now();

  getdata(BuildContext context) async {
    String format = DateFormat('yMMMM').format(selectedmonth);
    todayListNotifier.clear();
    Future.forEach(context.read<HiveImpl>().recentList, (TransationModel element) {
      String formatData = DateFormat('yMMMM').format(element.dateTime);
      if (format == formatData) {
        todayListNotifier.add(element);
      }
      notifyListeners();
    });
  }
}
