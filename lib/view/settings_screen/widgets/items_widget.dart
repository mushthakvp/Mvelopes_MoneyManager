import 'package:flutter/material.dart';
import '../../../utilities/color/colors.dart';

class ItemsWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const ItemsWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 25),
      width: double.infinity,
      height: 56,
      child: Row(
        children: [
          const SizedBox(width: 15),
          Icon(
            icon,
            color: indigColor,
          ),
          const SizedBox(width: 20),
          Text(
            text,
            style: const TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
