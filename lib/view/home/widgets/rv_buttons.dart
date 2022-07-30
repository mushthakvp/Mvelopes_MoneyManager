import 'package:flutter/material.dart';
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
          const Text(
            'Recent',
            style: TextStyle(
              fontSize: 16,
              color: pinkColor,
              fontFamily: 'JosefinSans',
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
            child: const Text(
              'ViewMore',
              style: TextStyle(
                fontSize: 16,
                color: indigColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontFamily: 'JosefinSans',
              ),
            ),
          )
        ],
      ),
    );
  }
}
