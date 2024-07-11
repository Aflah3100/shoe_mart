import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appTextStyle(
    {required double fontSize,
    required Color fontColor,
    required FontWeight fontWeight}) {
  return GoogleFonts.poppins(
      fontSize: fontSize, color: fontColor, fontWeight: fontWeight);
}

ButtonStyle appButtonStyle({Color? backgroundColor}) {
  return ButtonStyle(backgroundColor: WidgetStateProperty.all(backgroundColor));
}
