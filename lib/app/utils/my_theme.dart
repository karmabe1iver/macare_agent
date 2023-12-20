import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class MyTheme {
  static const Color bottomNavigationBarColor = Colors.white;
  static const Color bottomNavigationBarSelectedColor = Color(0xFF155A77);
  static const Color bottomNavigationBarUnSelectedColor = Colors.grey;
  static const Color appBarColor = Color(0xFF155A77);
  static const Color textColor = Color(0xFF878686);
  static const Color phoneNumberTextColor = Color(0xFF155A77);
  static const Color dividerColor = Color(0xFFE8E8F0);
  static const Color buttonColor = Color(0xFF31AC12);
  static const Color appBackgroundColor = Colors.white;
  static const Color smallFontColor = Color(0xFF5c6b73);
  static const Color numbersColor = Color(0xFF155A77);
  static const Color snackBarColor = Colors.black;
  static const Color snackBarTextColor = Colors.white;
  static  Color employeeColor = Colors.grey.shade200;
  static  Color rejectButtonColor = Colors.red.shade100;
  static  Color acceptButtonColor = Colors.green.shade100;

  //---------------[Textstyle]-----------------
  static TextStyle outfit(
      {FontStyle? fontStyle,
      Color? color,
      double? textSize,
      FontWeight? fontWeight,
      double? letterSpacing,
      TextDecoration? decoration,
      double? spacing}) {
    return GoogleFonts.montserrat(
      fontStyle: fontStyle,
      color: color?? Colors.black,
      fontSize: textSize ?? 15,
      fontWeight: fontWeight ?? FontWeight.normal,
      letterSpacing: letterSpacing,
      decoration: decoration
      
    );
  }
}
