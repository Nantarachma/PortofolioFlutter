import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? mobileLarge;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.mobileLarge,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  // Getter methods for screen sizes
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= kMobileBreakpoint;

  static bool isMobileLarge(BuildContext context) =>
      MediaQuery.of(context).size.width <= kMobileLargeBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width <= kTabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > kTabletBreakpoint;

  // Helper methods for responsive values
  static double getPadding(BuildContext context) {
    if (isMobile(context)) return kMobilePadding;
    if (isTablet(context)) return kTabletPadding;
    return kDesktopPadding;
  }

  static double getHeadingSize(BuildContext context) {
    if (isMobile(context)) return kMobileHeadingSize;
    if (isTablet(context)) return kTabletHeadingSize;
    return kDesktopHeadingSize;
  }

  static double getBodySize(BuildContext context) {
    if (isMobile(context)) return kMobileBodySize;
    if (isTablet(context)) return kTabletBodySize;
    return kDesktopBodySize;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // Desktop layout
    if (size.width > kTabletBreakpoint) {
      return desktop;
    }
    // Tablet layout
    if (size.width > kMobileLargeBreakpoint && tablet != null) {
      return tablet!;
    }
    // Large mobile layout
    if (size.width > kMobileBreakpoint && mobileLarge != null) {
      return mobileLarge!;
    }
    // Mobile layout
    return mobile;
  }
}