import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';

class AnimatedCounter extends StatelessWidget {
  const AnimatedCounter({
    Key? key,
    required this.value,
    this.text,  // Added optional text parameter
  }) : super(key: key);

  final int value;
  final String? text;  // Optional text to display after the number

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: IntTween(begin: 0, end: value),
      duration: const Duration(seconds: 3),  // Reduced animation time for better UX
      curve: Curves.easeInOut,  // Added curve for smoother animation
      builder: (context, value, child) => Text(
        "${value}${text ?? '+'}",  // Using optional text or default '+'
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          color: primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}