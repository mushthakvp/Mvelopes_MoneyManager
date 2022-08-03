import 'package:flutter/cupertino.dart';
import 'package:mvelopes/viewmodel/home/tapbar_pov.dart';
import 'package:provider/provider.dart';
import '../../../utilities/color/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tapbar extends StatelessWidget {
  const Tapbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _tapBarItem(name: 'Home', icon: CupertinoIcons.home, idx: 4, ter: 5, context: context),
          _tapBarItem(name: 'Income', icon: FontAwesomeIcons.sackDollar, idx: 0, ter: 0, context: context),
          _tapBarItem(name: 'Expense', icon: FontAwesomeIcons.wallet, idx: 1, ter: 0, context: context),
          _tapBarItem(name: 'Borrow', icon: FontAwesomeIcons.handshake, idx: 2, ter: 0, context: context),
          _tapBarItem(name: 'Lend', icon: FontAwesomeIcons.coins, idx: 3, ter: 0, context: context),
        ],
      ),
    );
  }

  Widget _tapBarItem({name, icon, idx, ter, required BuildContext context}) {
    return Consumer<TapBarPov>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            value.changeTapBar(index: idx);
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [indigColor, indigoLightColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              color: value.index == idx ? indigColor : transparentColor,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Padding(
              padding: value.index == idx
                  ? const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 15,
                    )
                  : const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 8,
                    ),
              child: Row(
                children: [
                  ter == 5 ? Icon(icon, color: value.index == idx ? whiteColor : pinkColor) : FaIcon(icon, color: value.index == idx ? whiteColor : pinkColor),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    child: Text(
                      value.index == idx ? name : '',
                      style: TextStyle(color: value.index == idx ? whiteColor : pinkColor, fontFamily: 'JosefinSans', fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
