import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mvelopes/viewmodel/settings/settings_pov.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    nextsplashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/image/logo.png',
          height: 150,
        ),
      ),
    );
  }

  nextsplashScreen() async {
    final obj = await SharedPreferences.getInstance();
    context.read<SettingsPov>().userName = obj.getString('userName') ?? 'User Name';
    context.read<SettingsPov>().buttonValue = obj.getBool('notifiCation') ?? false;
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      ),
    );
  }
}
