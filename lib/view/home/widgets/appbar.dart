import 'package:flutter/material.dart';
import '../../../utilities/color/colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'WelcomeBack',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: blackColor,
                ),
              ),
              Text(
                'Mushthak!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
