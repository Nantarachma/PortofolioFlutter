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
          Text(
            "Welcome to my\nPortfolio Website!",  // Fixed typo in "Portfolio"
            style: Responsive.isDesktop(context)
                ? Theme.of(context).textTheme.displaySmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,  // Added line height for better readability
            )
                : Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,  // Consistent line height
            ),
          ),
          const SizedBox(height: defaultPadding),  // Consistent spacing
          Responsive.isMobile(context)
              ? const Expanded(child: AnimatedText())
              : const AnimatedText(),
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
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Colors.white70,  // Added color for better visibility
      ),
      child: Row(
        children: [
          const Text("I specialize in "),
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TyperAnimatedText(
                "Android Development",
                speed: const Duration(milliseconds: 60),
              ),
              TyperAnimatedText(
                "Flutter Development",
                speed: const Duration(milliseconds: 60),
              ),
              TyperAnimatedText(
                "Back-End Development",
                speed: const Duration(milliseconds: 60),
              ),
              TyperAnimatedText(
                "Machine Learning",
                speed: const Duration(milliseconds: 60),
              ),
            ],
          ),
        ],
      ),
    );
  }
}