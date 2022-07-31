import 'package:flutter/material.dart';
import 'package:mvelopes/view/settings/settings_screen.dart';
import 'package:mvelopes/viewmodel/settings/settings_pov.dart';
import 'package:provider/provider.dart';
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
            children: [
              const Text(
                'WelcomeBack',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: blackColor,
                ),
              ),
              Consumer<SettingsPov>(
                builder: (context, value, child) {
                  return Text(
                    '${value.userName} !',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                      fontSize: 18,
                    ),
                  );
                },
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Settingsscreen(),
                ),
              );
            },
            child: const CircleAvatar(
              backgroundColor: whiteColor,
              backgroundImage: AssetImage('assets/image/man.png'),
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
    );
  }
}
