import 'package:flutter/material.dart';
import 'package:mvelopes/utilities/style/styles.dart';
import 'package:mvelopes/view/view_more/view_more_screen.dart';
import '../../../utilities/color/colors.dart';

class RvButtons extends StatelessWidget {
  const RvButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 8, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Recent',
            style: gFontsprimary(
              cr: pinkColor,
              we: FontWeight.bold,
              ls: 1,
            ),
          ),
          GestureDetector(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ViewMoreScreen(),
                ),
              );
            }),
            child: Text(
              'ViewMore',
              style: gFontsprimary(
                cr: indigColor,
                we: FontWeight.bold,
                ls: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
