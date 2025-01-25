import 'package:flutter/material.dart';
import 'package:portofolio_website/constant/constant.dart';

import '../../../../utils/responsive.dart';
import 'text_banner.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        maxHeight: 700,
        minHeight: 350, // Minimum height for smaller screens
      ),
      child: AspectRatio(
        aspectRatio: Responsive.isMobile(context)
            ? 1.5  // More vertical space on mobile
            : Responsive.isTablet(context)
            ? 2.2  // Balanced for tablet
            : 3.0, // Original desktop ratio
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image with ClipRRect
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                "assets/images/bg.jpeg",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: darkColor,
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.white24,
                        size: 62,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                gradient: LinearGradient(
                  colors: [
                    darkColor.withOpacity(0.85), // Stronger opacity at top
                    darkColor.withOpacity(0.2),  // Lighter at bottom
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.3, 1.0], // Gradient distribution
                ),
              ),
            ),

            // Content
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile(context)
                    ? defaultPadding
                    : defaultPadding * 2,
                vertical: defaultPadding,
              ),
              child: const TextBanner(),
            ),
          ],
        ),
      ),
    );
  }
}