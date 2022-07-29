import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../utilities/color/colors.dart';

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          colors: [indigColor, indigoLightColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedTextKit(
                isRepeatingAnimation: true,
                animatedTexts: [
                  ColorizeAnimatedText(
                    'User name',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                  ColorizeAnimatedText(
                    'Mvelopes',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                ],
              ),
              const CardContent(
                title: 'BALANCE',
                alinment: CrossAxisAlignment.start,
              ),
              const CardContent(
                title: 'INCOME',
                alinment: CrossAxisAlignment.start,
              ),
              const CardContent(
                title: 'EXPENSE',
                alinment: CrossAxisAlignment.start,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  child: Image.asset(
                    'assets/image/presentation.png',
                    height: 60,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const CardContent(
                title: 'BORROW',
                alinment: CrossAxisAlignment.end,
              ),
              const CardContent(
                title: 'LEND',
                alinment: CrossAxisAlignment.end,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final dynamic alinment;
  final String title;
  const CardContent({
    Key? key,
    required this.alinment,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alinment,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white,
            fontFamily: 'redhat',
          ),
        ),

        const SizedBox(height: 8),
        // ValueListenableBuilder(
        //   valueListenable: listner,
        //   builder: (context, value, Widget? _) {
        //     return Text(
        //       '₹ $value',
        //       style: const TextStyle(
        //         fontSize: 18,
        //         color: Colors.white,
        //         fontWeight: FontWeight.w600,
        //         fontFamily: 'redhat',
        //       ),
        //     );
        //   },
        // ),
      ],
    );
  }
}
