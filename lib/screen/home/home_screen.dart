import 'package:flutter/material.dart';
import 'package:portofolio_website/constant/constant.dart';
import 'package:portofolio_website/screen/home/component/content_page.dart';
import 'package:portofolio_website/screen/home/component/banner/home_banner.dart';

import '../../utils/responsive.dart';
import '../side/main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.getPadding(context),
            vertical: Responsive.isMobile(context)
                ? kMobilePadding
                : kTabletPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeBanner(),
              SizedBox(height: Responsive.isMobile(context)
                  ? kMobilePadding
                  : kTabletPadding),
              const ContentPage(),
              // Footer
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '© 2025 Rachmananta Ibnu Fajar',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}