import 'package:as_one/app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeText {
  TextStyle inActiveNavBarText() {
    return GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: ColorManager.inActiveColor);
  }

  TextStyle activeNavBarText() {
    return GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: ColorManager.mainColor);
  }

  TextStyle regularText() {
    return GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: ColorManager.blackColor,
    );
  }
}
