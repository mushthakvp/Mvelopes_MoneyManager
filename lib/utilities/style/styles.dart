import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../color/colors.dart';

gFontsprimary({
  cr = blackColor,
  double sz = 16.0,
  double ls = 0.0,
  we = FontWeight.normal,
}) {
  return GoogleFonts.amaranth(
    fontSize: sz,
    color: cr,
    letterSpacing: ls,
    fontWeight: we,
  );
}
