import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portofolio_website/constaint.dart';
import 'package:portofolio_website/screen/home/home_screen.dart';
import 'package:portofolio_website/responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rachmananta Portofolio',
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        canvasColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white)
            .copyWith(
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
      ),
      home: const HomeScreen(),
    );
  }
}