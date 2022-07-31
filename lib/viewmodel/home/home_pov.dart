import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../../model/add_edit/model/add_edit.dart';
import '../../utilities/color/colors.dart';

class HomePov extends ChangeNotifier {

  
  String dateSplit(DateTime data) {
    final date = DateFormat.MMMd().format(data);
    final dateSplit = date.split(' ');
    return '${dateSplit.last}\n${dateSplit.first}';
  }

  Color colorChecking(CategoryType data) {
    if (data == CategoryType.income) {
      return greenColor;
    } else if (data == CategoryType.expense) {
      return pinkColor;
    } else if (data == CategoryType.borrow) {
      return pinkColor;
    } else if (data == CategoryType.lend) {
      return greenColor;
    } else {
      return greenColor;
    }
  }

  FaIcon listIcon(value) {
    if (value == CategoryType.expense) {
      return FaIcon(FontAwesomeIcons.wallet, color: colorChecking(value));
    } else if (value == CategoryType.income) {
      return FaIcon(FontAwesomeIcons.sackDollar, color: colorChecking(value));
    } else if (value == CategoryType.borrow) {
      return FaIcon(FontAwesomeIcons.handshake, color: colorChecking(value));
    } else {
      return FaIcon(FontAwesomeIcons.coins, color: colorChecking(value));
    }
  }
}
