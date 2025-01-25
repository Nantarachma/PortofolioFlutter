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

  // Screen size conditions
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= kMobileBreakpoint;

  static bool isMobileLarge(BuildContext context) =>
      MediaQuery.of(context).size.width <= kMobileLargeBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width <= kTabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > kTabletBreakpoint;

  static bool isTallScreen(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.height > 2000 || size.height / size.width > 2;
  }

  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  // Responsive measurements
  static double getPadding(BuildContext context) {
    double basePadding;
    if (isMobile(context)) {
      basePadding = kMobilePadding;
    } else if (isTablet(context)) {
      basePadding = kTabletPadding;
    } else {
      basePadding = kDesktopPadding;
    }

    // Adjust padding for different scenarios
    if (isTallScreen(context)) {
      basePadding *= 1.2;
    }
    if (isLandscape(context)) {
      basePadding *= 1.1;
    }

    return basePadding;
  }

  static double getHeadingSize(BuildContext context) {
    double baseSize;
    if (isMobile(context)) {
      baseSize = kMobileHeadingSize;
    } else if (isTablet(context)) {
      baseSize = kTabletHeadingSize;
    } else {
      baseSize = kDesktopHeadingSize;
    }

    // Adjust font size for different scenarios
    if (isTallScreen(context)) {
      baseSize *= 1.15;
    }
    if (isLandscape(context)) {
      baseSize *= 0.9;
    }

    return baseSize;
  }

  static double getBodySize(BuildContext context) {
    double baseSize;
    if (isMobile(context)) {
      baseSize = kMobileBodySize;
    } else if (isTablet(context)) {
      baseSize = kTabletBodySize;
    } else {
      baseSize = kDesktopBodySize;
    }

    // Adjust font size for different scenarios
    if (isTallScreen(context)) {
      baseSize *= 1.1;
    }
    if (isLandscape(context)) {
      baseSize *= 0.95;
    }

    return baseSize;
  }

  static double getIconSize(BuildContext context) {
    double baseSize = getBodySize(context) * 1.5;

    if (isTallScreen(context)) {
      baseSize *= 1.1;
    }

    return baseSize;
  }

  // Custom spacing calculations
  static double getVerticalSpacing(BuildContext context) {
    return getPadding(context) * (isTallScreen(context) ? 1.5 : 1.0);
  }

  static double getHorizontalSpacing(BuildContext context) {
    return getPadding(context) * (isLandscape(context) ? 1.2 : 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (size.width > kTabletBreakpoint) {
      return desktop;
    }

    if (size.width > kMobileLargeBreakpoint && tablet != null) {
      return tablet!;
    }

    if (size.width > kMobileBreakpoint && mobileLarge != null) {
      return mobileLarge!;
    }

    return mobile;
  }
}