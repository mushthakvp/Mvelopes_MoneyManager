import 'package:flutter/material.dart';
import 'package:mvelopes/viewmodel/add_edit/hive_impl.dart';
import 'package:mvelopes/viewmodel/home/tapbar_pov.dart';
import 'package:provider/provider.dart';
import '../../model/add_edit/model/add_edit.dart';
import '../../utilities/color/colors.dart';
import '../add_edit/add_edit_screen.dart';
import '../widgets/home_listview.dart';
import 'widgets/appbar.dart';
import 'widgets/info_card.dart';
import 'widgets/rv_buttons.dart';
import 'widgets/tapbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarWidget(),
            const InfoCardWidget(),
            const Tapbar(),
            const RvButtons(),
            Expanded(
              child: Consumer<TapBarPov>(
                builder: (context, value, child) {
                  return HomeListView(
                    idx: value.index,
                    checkLength: true,
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: indigColor,
        elevation: 10,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddEditScreen(
                type: ScreenType.add,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  List<TransationModel> returnList(int index, BuildContext context) {
    switch (index) {
      case 0:
        return Provider.of<HiveImpl>(context).recentList;
      case 1:
        return Provider.of<HiveImpl>(context).incomeList;

      case 2:
        return Provider.of<HiveImpl>(context).expenceList;

      case 3:
        return Provider.of<HiveImpl>(context).borrowList;

      default:
        return Provider.of<HiveImpl>(context).lendList;
    }
  }
}
