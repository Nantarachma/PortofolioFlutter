import 'package:flutter/material.dart';
import 'package:portofolio_website/screen/home/home_screen.dart';
import 'package:portofolio_website/utils/app_theme.dart';

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
      theme: AppTheme.theme,
      home: const HomeScreen(),
    );
  }
}