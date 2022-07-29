import 'dart:async';
import 'package:flutter/material.dart';

import '../home_screen/home_screen.dart';

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

  nextsplashScreen() {
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
