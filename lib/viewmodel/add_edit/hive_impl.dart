import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mvelopes/model/add_edit/add_edit_service.dart';
import 'package:mvelopes/model/add_edit/model/add_edit.dart';

class HiveImpl extends AddEditService with ChangeNotifier {
  HiveImpl() {
    refreshUi();
  }

  final String dbName = 'Tmodeldb';
  List<TransationModel> incomeList = [];
  List<TransationModel> expenceList = [];
  List<TransationModel> borrowList = [];
  List<TransationModel> lendList = [];
  List<TransationModel> recentList = [];

  @override
  Future<void> addDetails(TransationModel value) async {
    final obj = await Hive.openBox<TransationModel>(dbName);
    obj.put(value.id, value);
    await getDeatails();
  }

  @override
  Future<void> deleteDetails(String id) async {
    final obj = await Hive.openBox<TransationModel>(dbName);
    obj.delete(id);
  }

  @override
  Future<List<TransationModel>> getDeatails() async {
    final obj = await Hive.openBox<TransationModel>(dbName);
    return obj.values.toList();
  }

  @override
  Future<void> updataeDetails(TransationModel value) async {
    final obj = await Hive.openBox<TransationModel>(dbName);
    obj.put(value.id, value);
  }

  refreshUi() async {
    recentList.clear();
    incomeList.clear();
    expenceList.clear();
    borrowList.clear();
    lendList.clear();
    final data = await getDeatails();
    recentList.addAll(data);
    Future.forEach(data, (TransationModel dbValues) {
      if (dbValues.type == CategoryType.borrow) {
        borrowList.add(dbValues);
      } else if (dbValues.type == CategoryType.lend) {
        lendList.add(dbValues);
      } else if (dbValues.type == CategoryType.income) {
        incomeList.add(dbValues);
      } else if (dbValues.type == CategoryType.expense) {
        expenceList.add(dbValues);
      }
    });

    notifyListeners();
  }

  returnList(int index) {
    switch (index) {
      case 0:
        notifyListeners();
        return recentList;
      case 1:
        notifyListeners();
        return incomeList;

      case 2:
        notifyListeners();
        return expenceList;

      case 3:
        notifyListeners();
        return borrowList;

      default:
        notifyListeners();
        return lendList;
    }
  }
}
