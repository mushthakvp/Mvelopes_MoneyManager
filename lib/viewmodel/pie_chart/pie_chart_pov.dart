import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../model/add_edit/model/add_edit.dart';

class Chartdata {
  String? categories;
  double? amount;
  Chartdata({required this.categories, required this.amount});
}

class PieChartPov extends ChangeNotifier {
  late TooltipBehavior tooltipBehavior;

  List<Chartdata> chartData = [];

  PieChartPov() {
    tooltipBehavior = TooltipBehavior(enable: true);
    getdata();
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

  final String dbName = 'Tmodeldb';

  Future<List<TransationModel>> getDeatails() async {
    final obj = await Hive.openBox<TransationModel>(dbName);
    return obj.values.toList();
  }

  DateTime selectedmonth = DateTime.now();

  getdata() async {
    final list = await getDeatails();
    String format = DateFormat('yMMMM').format(selectedmonth);

    todayListNotifier.clear();
    Future.forEach(
      list,
      (TransationModel element) {
        String formatData = DateFormat('yMMMM').format(element.dateTime);
        if (format == formatData) {
          todayListNotifier.add(element);
        }
      },
    );
    await getChartData();
  }

  getChartData() {
    chartData = listOfData(todayListNotifier);
    notifyListeners();
  }

  pickDate(context) async {
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: selectedmonth,
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
    );

    selectedmonth = selected!;

    await getdata();
    notifyListeners();
  }
}
