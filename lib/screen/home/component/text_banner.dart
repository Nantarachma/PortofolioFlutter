import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';
import 'package:portofolio_website/responsive.dart';

class TextBanner extends StatelessWidget {
  const TextBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Welcome text with adjusted fontSize for mobile
          Text(
            "Welcome to my\nPortfolio Website!",
            style: Responsive.isDesktop(context)
                ? Theme.of(context).textTheme.displaySmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            )
                : Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
              // Adjust fontSize for mobile
              fontSize: Responsive.isMobile(context) ? 24 : null,
            ),
          ),
          const SizedBox(height: defaultPadding),
          // Wrap AnimatedText with SizedBox for mobile
          if (Responsive.isMobile(context))
            const SizedBox(
              height: 50, // Fixed height for mobile
              child: AnimatedText(),
            )
          else
            const AnimatedText(),
        ],
      ),
    );
  }
}

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      // Remove maxLines constraint
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Colors.white70,
        // Adjust fontSize for mobile
        fontSize: Responsive.isMobile(context) ? 14 : 16,
      ),
      child: Row(
        children: [
          if (Responsive.isMobile(context))
          // For mobile, use shorter text
            const Text("I'm into ")
          else
            const Text("I specialize "),
          Expanded(
            // Wrap with Expanded to prevent overflow
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                // Adjust text for mobile if needed
                TyperAnimatedText(
                  _getAnimatedText(context, "Android Development"),
                  speed: const Duration(milliseconds: 60),
                ),
                TyperAnimatedText(
                  _getAnimatedText(context, "Flutter Development"),
                  speed: const Duration(milliseconds: 60),
                ),
                TyperAnimatedText(
                  _getAnimatedText(context, "Back-End Development"),
                  speed: const Duration(milliseconds: 60),
                ),
                TyperAnimatedText(
                  _getAnimatedText(context, "Machine Learning"),
                  speed: const Duration(milliseconds: 60),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to get appropriate text based on screen size
  String _getAnimatedText(BuildContext context, String text) {
    if (Responsive.isMobile(context)) {
      // Shorten text for mobile if needed
      switch (text) {
        case "Android Development":
          return "Android Dev";
        case "Flutter Development":
          return "Flutter Dev";
        case "Back-End Development":
          return "Back-End Dev";
        default:
          return text;
      }
    }
    return text;
  }
}