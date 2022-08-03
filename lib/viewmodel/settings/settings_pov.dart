import 'dart:math';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mvelopes/model/add_edit/model/add_edit.dart';
import 'package:mvelopes/viewmodel/add_edit/hive_impl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utilities/color/colors.dart';
import '../../view/splash_screen/splash_screen.dart';
import '../notification/awsome_notification.dart';

class SettingsPov extends ChangeNotifier {
  final nameController = TextEditingController();
  final calculateController = TextEditingController();
  String userName = 'User name';

  userNameChanged({required String name}) async {
    final obj = await SharedPreferences.getInstance();
    obj.setString('userName', nameController.text);
    if (name.trim().isEmpty) {
      userName = nameController.text;
    } else {
      userName = name;
    }

    notifyListeners();
  }

  bool buttonValue = false;

  // checkNotification(BuildContext context) async {
  //   if (buttonValue == true) {
  //     await createPersistentNotification(context);
  //   }
  // }

  buttonValuechange(bool buttonValue, BuildContext context) async {
    this.buttonValue = buttonValue;
    notificationAdd(value: buttonValue, context: context);
    final shared = await SharedPreferences.getInstance();
    await shared.setBool('notifiCation', buttonValue);
    notifyListeners();
  }

  notificationAdd({value, required BuildContext context}) async {
    if (value == true) {
      await createPersistentNotification(context);
    } else {
      await AwesomeNotifications().resetGlobalBadge();
    }
  }

  mailLaunch() async {
    final Uri email = Uri(
      scheme: 'mailto',
      path: 'mvelopes.fouvty@hi2.in',
    );
    if (await launchUrl(email)) {
      throw 'Could not launch ';
    }
  }

  urlLaunch(String link, LaunchMode data) async {
    Uri url = Uri.parse(link);
    if (!await launchUrl(
      url,
      mode: data,
      webViewConfiguration: const WebViewConfiguration(),
      webOnlyWindowName: 'Mvelopes',
    )) {
      throw 'Could not launch $url';
    }
  }

  randomNumberGenerator() {
    var rng = Random();
    int num = 0;
    for (int i = 0; i < 10; i++) {
      num = rng.nextInt(10);
    }
    return num;
  }

  final String dbName = 'Tmodeldb';
  int total = 0;

  resetData({required int one, required int two, required context}) async {
    total = one + two;
    final answer = calculateController.text.trim();
    if (int.parse(answer) == total) {
      final obj = await Hive.openBox<TransationModel>(dbName);
      await obj.clear();
      await Provider.of<HiveImpl>(context, listen: false).refreshUi();
      calculateController.text = '';
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        ),
        (route) => false,
      );
    } else {
      Fluttertoast.showToast(
        backgroundColor: pinkColor,
        msg: 'Enter Correct Answer', // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.BOTTOM, // location
        timeInSecForIosWeb: 1,
      );
    }
  }
}
