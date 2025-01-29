import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portofolio_website/constant/constant.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData.dark().copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: bgColor,
      canvasColor: bgColor,
      textTheme: GoogleFonts.poppinsTextTheme().apply(bodyColor: Colors.white).copyWith(
        // Responsive text styles
        displayLarge: TextStyle(
          color: bodyTextColor,
          fontSize: kDesktopHeadingSize,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: bodyTextColor,
          fontSize: kTabletHeadingSize,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: bodyTextColor,
          fontSize: kMobileHeadingSize,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: bodyTextColor,
          fontSize: kDesktopBodySize,
        ),
        bodyMedium: TextStyle(
          color: bodyTextColor,
          fontSize: kTabletBodySize,
        ),
        bodySmall: TextStyle(
          color: bodyTextColor,
          fontSize: kMobileBodySize,
        ),
      ),
    );
  }
}