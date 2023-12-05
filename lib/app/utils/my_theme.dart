import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class MyTheme {
  static const Color bottomNavigationBarColor = Colors.white;
  static const Color bottomNavigationBarSelectedColor = Colors.black;
  static const Color bottomNavigationBarUnSelectedColor = Colors.grey;
  static const Color appbarColor = Color(0xFF155A77);
  static const Color textColor = Color(0xFF878686);
  static const Color phonenumbertextColor = Color(0xFF155A77);
  static const Color dividerColor = Color(0xFFE8E8F0);
  static const Color buttonColor = Color(0xFF31AC12);

  //---------------[Textstyle]-----------------
  static TextStyle outfit(
      {FontStyle? fontStyle,
      Color? color,
      double? textSize,
      FontWeight? fontWeight,
      double? letterSpacing,
      TextDecoration? decoration,
      double? spacing}) {
    return GoogleFonts.outfit(
      color: color?? Colors.black,
      fontSize: textSize ?? 15,
      fontWeight: fontWeight ?? FontWeight.normal,
      letterSpacing: letterSpacing,
      decoration: decoration
    );
  }
}
