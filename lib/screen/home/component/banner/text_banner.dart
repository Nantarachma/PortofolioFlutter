import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portofolio_website/constant/constant.dart';
import 'package:portofolio_website/utils/responsive.dart';

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
              fontSize: Responsive.isMobile(context) ? 24 : null,
            ),
          ),
          const SizedBox(height: defaultPadding),
          if (Responsive.isMobile(context))
            const SizedBox(
              height: 50,
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
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Colors.white70,
        fontSize: Responsive.isMobile(context) ? 14 : 16,
      ),
      child: Row(
        children: [
          if (Responsive.isMobile(context))
            const Text("I'm into ")
          else
            const Text("I specialize in "),
          Expanded(
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
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

  String _getAnimatedText(BuildContext context, String text) {
    if (Responsive.isMobile(context)) {
      switch (text) {
        case "Android Development":
          return "Android Dev";
        case "Flutter Development":
          return "Flutter Dev";
        case "Back-End Development":
          return "Back-End Dev";
        case "Machine Learning":
          return "ML";
        default:
          return text;
      }
    }
    return text;
  }
}