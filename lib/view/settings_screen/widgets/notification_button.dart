import 'package:flutter/material.dart';
import 'package:mvelopes/viewmodel/settings/settings_pov.dart';
import 'package:provider/provider.dart';
import '../../../utilities/color/colors.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        width: double.infinity,
        height: 56,
        child: Row(
          children: [
            const SizedBox(width: 15),
            const Icon(Icons.notifications_none_outlined, color: indigColor),
            const SizedBox(width: 20),
            const Text(
              'Notification',
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Consumer<SettingsPov>(builder: (context, value, _) {
                  return Switch(
                      value: value.buttonValue,
                      onChanged: (valueChanged) {
                        value.buttonValuechange(valueChanged, context);
                      });
                }),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
