import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const whiteColor = Colors.white;
const transparentColor = Colors.transparent;
const blackColor = Colors.black;
const mainColor = Color(0xFF070618);
const pinkColor = Color(0xFFFF6F91);

const indigoLightColor = Color(0xFF0091B5);
const indigColor = Color(0xFF3F51B5);
const greyColor = Colors.grey;
const greenColor = Colors.green;
const greyLight = Color(0x4DCAC8C8);
const skyBlueColor = Color(0xFF99CCFF);

const colorizeColors = [whiteColor, pinkColor, indigoLightColor];

class Lw {
  snBars({stColor = transparentColor, snColor = transparentColor}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarColor: snColor, systemNavigationBarIconBrightness: Brightness.dark, statusBarBrightness: Brightness.dark, statusBarColor: stColor),
    );
  }

  SizedBox space({double h = 10, double w = 10}) {
    return SizedBox(
      height: h,
      width: w,
    );
  }
}
