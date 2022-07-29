import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:mvelopes/viewmodel/add_edit/hive_impl.dart';
import 'package:provider/provider.dart';
import '../../utilities/color/colors.dart';

class HomeListView extends StatelessWidget {
  final bool checkLength;
  final int idx;
  const HomeListView({
    Key? key,
    required this.checkLength,
    required this.idx,
  }) : super(key: key);

  final String tittle = 'Delete';
  final String discription = 'Are you sure delete this field';
  final String lotie = 'assets/image/delete.json';

  @override
  Widget build(BuildContext context) {
    //TransactionData().refreshUi();
    return
        // widget.list.isEmpty
        //     ? Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Center(
        //             child: SvgPicture.asset(
        //               'assets/image/nopData.svg',
        //               width: 200,
        //             ),
        //           ),
        //           const SizedBox(
        //             height: 20,
        //           ),
        //           const Text(
        //             'No Transaction Data',
        //             style: TextStyle(
        //               fontWeight: FontWeight.w800,
        //               color: pinkColor,
        //               letterSpacing: 1,
        //               fontSize: 16,
        //             ),
        //           )
        //         ],
        //       )
        //     :
        Consumer<HiveImpl>(
      builder: (BuildContext context, value, Widget? _) {
        return value.recentList.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final data = idx == 0
                      ? value.recentList[index]
                      : idx == 1
                          ? value.incomeList[index]
                          : idx == 2
                              ? value.expenceList[index]
                              : idx == 3
                                  ? value.borrowList[index]
                                  : idx == 4
                                      ? value.lendList[index]
                                      : value.expenceList[index];
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
                                  // showDialog(context: context, builder: (context) => dialogShow(context, data.id));
                                },
                                autoClose: true,
                                label: "Delete",
                                icon: Icons.delete,
                                backgroundColor: indigColor,
                              ),
                              SlidableAction(
                                onPressed: (context) {
                                  //  Lf().nextPage(context: context, screen: Editscreen(data: data),);
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
                                const CircleAvatar(
                                  radius: 30,
                                  child: Text(
                                    'fgyug',
                                    // Lf().datesplit(data.dateTime),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
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
                                      style: const TextStyle(fontSize: 18, fontFamily: 'JosefinSans'),
                                    ),
                                    Lw().space(h: 5),
                                    Text(
                                      '₹ ${data.amount.toString()}',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        // color: Lf().colorChecking(data.type),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      // Lf().listIcon(data.type),
                                      SizedBox(width: 20),
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

  Dialog dialogShow(BuildContext context, String index) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: transparentColor,
      child: dialogContent(context, index),
    );
  }

  dialogContent(BuildContext context, String index) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: 80,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: whiteColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                tittle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                discription,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 80,
                    child: TextButton(
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: blackColor, fontSize: 16, fontFamily: 'redhat'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: TextButton(
                      onPressed: (() {
                        // setState(() {
                        //   // TransactionData.instance.deleteTransaction(index);
                        //   //  TransactionData.instance.refreshUi();
                        //   Navigator.of(context).pop();
                        // });
                      }),
                      child: Text(
                        tittle,
                        style: const TextStyle(color: blackColor, fontSize: 16, fontFamily: 'redhat'),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: whiteColor,
              radius: 45,
              child: Lottie.asset(
                lotie,
              ),
            ),
          ],
        ),
      ],
    );
  }

  int returnList(int index, BuildContext context) {
    switch (index) {
      case 0:
        return Provider.of<HiveImpl>(context, listen: false).recentList.length;
      case 1:
        return Provider.of<HiveImpl>(context, listen: false).incomeList.length;

      case 2:
        return Provider.of<HiveImpl>(context, listen: false).expenceList.length;

      case 3:
        return Provider.of<HiveImpl>(context, listen: false).borrowList.length;

      default:
        return Provider.of<HiveImpl>(context, listen: false).lendList.length;
    }
  }
}
