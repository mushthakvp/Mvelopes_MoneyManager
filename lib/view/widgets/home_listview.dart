import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvelopes/view/widgets/delete_widget.dart';
import 'package:mvelopes/viewmodel/add_edit/hive_impl.dart';
import 'package:mvelopes/viewmodel/home/home_pov.dart';
import 'package:provider/provider.dart';
import '../../utilities/color/colors.dart';
import '../../utilities/style/styles.dart';
import '../add_edit_screen/add_edit_screen.dart';

class HomeListView extends StatelessWidget {
  final bool checkLength;
  final int idx;
  const HomeListView({
    Key? key,
    required this.checkLength,
    required this.idx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HiveImpl>(
      builder: (BuildContext context, value, Widget? _) {
        return returnList(idx, context) <= 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'assets/image/nopData.svg',
                      width: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'No Transaction Data',
                    style: gFontsprimary(
                      sz: 20,
                      cr: indigColor,
                      we: FontWeight.bold,
                      ls: 1,
                    ),
                  )
                ],
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final data = idx == 0
                      ? value.incomeList[index]
                      : idx == 1
                          ? value.expenceList[index]
                          : idx == 2
                              ? value.borrowList[index]
                              : idx == 3
                                  ? value.lendList[index]
                                  : idx == 4
                                      ? value.recentList[index]
                                      : value.recentList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    child: Card(
                      elevation: 4,
                      child: SizedBox(
                        child: Slidable(
                          endActionPane: ActionPane(
                            motion: const BehindMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => DeleteWidget(
                                      index: data.id,
                                    ),
                                  );
                                },
                                autoClose: true,
                                label: "Delete",
                                icon: Icons.delete,
                                backgroundColor: indigColor,
                              ),
                              SlidableAction(
                                onPressed: (context) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddEditScreen(
                                        type: ScreenType.edit,
                                        data: data,
                                      ),
                                    ),
                                  );
                                },
                                icon: Icons.edit,
                                label: 'Edit',
                                backgroundColor: pinkColor,
                                foregroundColor: whiteColor,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 5, bottom: 6),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  child: Text(
                                    context.read<HomePov>().dateSplit(data.dateTime),
                                    textAlign: TextAlign.center,
                                    style: gFontsprimary(
                                      cr: whiteColor,
                                      we: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.notes,
                                      overflow: TextOverflow.ellipsis,
                                      style: gFontsprimary(
                                        sz: 18,
                                        cr: blackColor,
                                        we: FontWeight.w600,
                                        ls: .6,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Lw().space(h: 5),
                                    Text(
                                      '₹ ${data.amount.toString()}',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: context.read<HomePov>().colorChecking(data.type),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      context.read<HomePov>().listIcon(data.type),
                                      const SizedBox(width: 20),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: checkLength
                    ? returnList(idx, context) > 5
                        ? 5
                        : returnList(idx, context)
                    : returnList(idx, context),
              );
      },
    );
  }

  int returnList(int index, BuildContext context) {
    switch (index) {
      case 0:
        return Provider.of<HiveImpl>(context, listen: false).incomeList.length;
      case 1:
        return Provider.of<HiveImpl>(context, listen: false).expenceList.length;

      case 2:
        return Provider.of<HiveImpl>(context, listen: false).borrowList.length;

      case 3:
        return Provider.of<HiveImpl>(context, listen: false).lendList.length;

      default:
        return Provider.of<HiveImpl>(context, listen: false).recentList.length;
    }
  }
}
