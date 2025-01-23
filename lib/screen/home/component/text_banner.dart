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
            "This is my \nPortofolio!",
            style: Responsive.isDesktop(context)
                ? Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white)
                : Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          if (!Responsive.isMobileLarge(context))
            SizedBox(
              height: defaultPadding /2,
            ),
          Responsive.isMobile(context) ? Expanded(child: AnimatedText()) : AnimatedText()
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
      style: Theme.of(context).textTheme.titleMedium!,
      child: Row(
        children: [
          Text("I specialize in "),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText("Android Developer."),
              TyperAnimatedText("Flutter Developer."),
              TyperAnimatedText("Back-End Developer."),
              TyperAnimatedText("Machine Learning."),
            ],
          ),
        ],
      ),
    );
  }
}
