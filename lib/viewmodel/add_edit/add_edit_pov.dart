import 'package:flutter/material.dart';
import 'package:mvelopes/viewmodel/add_edit/hive_impl.dart';
import 'package:mvelopes/viewmodel/settings/settings_pov.dart';
import 'package:provider/provider.dart';
import '../../model/add_edit/model/add_edit.dart';
import '../../utilities/color/colors.dart';

class AddEditPov extends ChangeNotifier {
  final notesController = TextEditingController();
  final amountController = TextEditingController();
  var dateNow = DateTime.now();
  final dropList = ['Income', 'Expense', 'Borrow', 'Lend'];
  String? dropName;
  late CategoryType globalType;

  @override
  void dispose() {
    notesController.text = '';
    super.dispose();
  }

  changeDropName({required var dropName}) {
    this.dropName = dropName;
    notifyListeners();
  }

  categoryConvert(CategoryType data) {
    if (data == CategoryType.income) {
      return 'Income';
    } else if (data == CategoryType.expense) {
      return 'Expense';
    } else if (data == CategoryType.borrow) {
      return 'Borrow';
    } else if (data == CategoryType.lend) {
      return 'Lend';
    }
  }

  categoryTypeChecking(var data) {
    if (data == 'Income') {
      globalType = CategoryType.income;
    } else if (data == 'Expense') {
      globalType = CategoryType.expense;
    } else if (data == 'Borrow') {
      globalType = CategoryType.borrow;
    } else if (data == 'Lend') {
      globalType = CategoryType.lend;
    }
    notifyListeners();
  }

  datePicker({required BuildContext context}) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: dateNow,
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    );
    newDate == null ? dateNow : dateNow = newDate;
    notifyListeners();
  }

  submitDetails(BuildContext context) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    final note = notesController.text.trim();
    final price = amountController.text.trim();
    final amount = double.tryParse(price);
    final category = dropName ?? '';
    if (note.isEmpty || price.isEmpty || amount!.isNegative || category.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          padding: EdgeInsets.all(14),
          elevation: 6,
          backgroundColor: indigColor,
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Please Fill Fields',
            style: TextStyle(fontSize: 14),
          ),
        ),
      );
    } else {
      final allData = TransationModel(
        notes: note,
        amount: amount,
        dateTime: dateNow,
        type: globalType,
        id: id,
      );

      await Provider.of<HiveImpl>(context, listen: false).addDetails(allData);
      await context.read<HiveImpl>().refreshUi();
      notesController.text = '';
      amountController.text = '';
      await context.read<SettingsPov>().notificationAdd(
            context: context,
            value: context.read<SettingsPov>().buttonValue,
          );
      Navigator.of(context).pop();
    }
  }

  updateDetails(BuildContext context, String id) async {
    final note = notesController.text.trim();
    final price = amountController.text.trim();
    final amount = double.tryParse(price);
    final category = dropName ?? '';
    if (note.isEmpty || price.isEmpty || amount!.isNegative || category.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          padding: EdgeInsets.all(14),
          elevation: 6,
          backgroundColor: indigColor,
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Please Fill Fields',
            style: TextStyle(fontSize: 14),
          ),
        ),
      );
    } else {
      final allData = TransationModel(
        notes: note,
        amount: amount,
        dateTime: dateNow,
        type: globalType,
        id: id,
      );

      await Provider.of<HiveImpl>(context, listen: false).updataeDetails(allData);
      await context.read<HiveImpl>().refreshUi();
      notesController.text = '';
      amountController.text = '';

      await context.read<SettingsPov>().notificationAdd(
            context: context,
            value: context.read<SettingsPov>().buttonValue,
          );

      Navigator.of(context).pop();
    }
  }
}
