import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../utilities/color/colors.dart';
import '../../../viewmodel/settings/settings_pov.dart';

class ResetDialogue extends StatelessWidget {
  final int one;
  final int two;
  const ResetDialogue({Key? key, required this.one, required this.two}) : super(key: key);

  final String tittle = 'Reset';
  final String discription = 'Making Sure its you';
  final String lotie = 'assets/image/wipeData.json';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: transparentColor,
      child: Stack(
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
                const SizedBox(height: 5),
                Text(
                  discription,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '$one + $two',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 14),
                Container(
                  height: 45,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: context.read<SettingsPov>().calculateController,
                    textAlign: TextAlign.center,
                    cursorColor: indigColor,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
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
                          context.read<SettingsPov>().calculateController.text = '';
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
                          context.read<SettingsPov>().resetData(
                                one: one,
                                two: two,
                                context: context,
                              );
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
                child: Lottie.asset(lotie, height: 60),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
