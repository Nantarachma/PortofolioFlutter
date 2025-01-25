import 'package:flutter/material.dart';

// Monochrome dengan sentuhan biru gelap
const darkColor = Color(0xFF0F172A);       // Dark Blue Gray - untuk aksen
const primaryColor = Color(0xFF1E88E5);
const secondaryColor = Color(0xFF242430);
const bodyTextColor = Color(0xFF8B8B8D);
const bgColor = Color(0xFF1E1E28);     // Almost Black - untuk background utama

// Spacing
const defaultPadding = 20.0;
const defaultDuration = Duration(seconds: 1); // we use it on our animation

// Screen sizes
const double kMobileBreakpoint = 480.0;
const double kMobileLargeBreakpoint = 900.0;  // Increased from 768.0
const double kTabletBreakpoint = 1200.0;      // Increased from 1024.0
const double kDesktopBreakpoint = 1440.0;
const maxWidth = 1920.0;

// Adjust paddings for taller screens
const double kMobilePadding = 20.0;           // Increased from 16.0
const double kTabletPadding = 28.0;           // Increased from 24.0
const double kDesktopPadding = 36.0;          // Increased from 32.0

// Adjust font sizes for better readability on tall screens
const double kMobileHeadingSize = 28.0;       // Increased from 24.0
const double kTabletHeadingSize = 32.0;       // Increased from 28.0
const double kDesktopHeadingSize = 36.0;      // Increased from 32.0

const double kMobileBodySize = 16.0;          // Increased from 14.0
const double kTabletBodySize = 18.0;          // Increased from 16.0
const double kDesktopBodySize = 20.0;         // Increased from 18.0