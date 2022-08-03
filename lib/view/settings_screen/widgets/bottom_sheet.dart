import 'package:flutter/material.dart';
import 'package:mvelopes/viewmodel/settings/settings_pov.dart';
import 'package:provider/provider.dart';
import '../../../utilities/color/colors.dart';
import '../../add_edit_screen/widgets/textfield.dart';

class BottomSheetSettings extends StatelessWidget {
  const BottomSheetSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            backgroundColor: whiteColor,
            radius: 60,
            backgroundImage: AssetImage('assets/image/man.png'),
          ),
          const SizedBox(height: 30),
          TextFieldsWidget(
            icon: Icons.person,
            hint: 'User name',
            controllerText: context.read<SettingsPov>().nameController,
            type: TextInputType.name,
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: MediaQuery.of(context).size.width * .84,
            child: ElevatedButton(
              onPressed: () {
                context.read<SettingsPov>().userNameChanged(name: '');
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: indigColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // <-- Radius
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'SUBMIT',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'redhat',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
