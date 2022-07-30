import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mvelopes/utilities/color/colors.dart';
import 'package:mvelopes/viewmodel/view_more/view_more_pov.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class ViewMoreScreen extends StatelessWidget {
  const ViewMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Consumer<ViewMorePov>(
          builder: (BuildContext context, value, Widget? child) {
            return Text(
              value.appBarName(index: value.index),
            );
          },
        ),
      ),
      body: Consumer<ViewMorePov>(
        builder: (context, value, child) {
          return value.bodyIndex[value.index];
        },
      ),
      bottomNavigationBar: Container(
        color: indigColor,
        child: Consumer<ViewMorePov>(
          builder: (BuildContext context, value, Widget? child) {
            return SalomonBottomBar(
              onTap: ((idx) {
                value.navigationChange(idx);
              }),
              currentIndex: value.index,
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(
                    FontAwesomeIcons.sackDollar,
                    color: whiteColor,
                  ),
                  title: const Text("Income"),
                  selectedColor: whiteColor,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(
                    FontAwesomeIcons.wallet,
                    color: whiteColor,
                  ),
                  title: const Text("Expense"),
                  selectedColor: whiteColor,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(
                    FontAwesomeIcons.handshake,
                    color: whiteColor,
                  ),
                  title: const Text("Borrow"),
                  selectedColor: whiteColor,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(
                    FontAwesomeIcons.coins,
                    color: whiteColor,
                  ),
                  title: const Text("Lend"),
                  selectedColor: whiteColor,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
