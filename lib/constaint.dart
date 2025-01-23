import 'package:flutter/material.dart';

// Monochrome dengan sentuhan biru gelap
const primaryColor = Color(0xFFE2E8F0);    // Light Gray - untuk elemen utama
const secondaryColor = Color(0xFF334D73);  // Medium Gray - untuk elemen sekunder
const darkColor = Color(0xFF0F172A);       // Dark Blue Gray - untuk aksen
const bodyTextColor = Color(0xFFF8FAFC);   // Off White - untuk teks pada background gelap
const bgColor = Color(0xFF292929);         // Almost Black - untuk background utama

// Spacing
const defaultPadding = 20.0;
const defaultDuration = Duration(seconds: 1); // we use it on our animation

// Screen sizes
const double kMobileBreakpoint = 480.0;      // For small mobile devices
const double kMobileLargeBreakpoint = 768.0; // For larger mobile devices/small tablets
const double kTabletBreakpoint = 1024.0;     // For tablets
const double kDesktopBreakpoint = 1440.0;    // For desktop screens
const maxWidth = 1920.0;                     // max width of our web

// Responsive paddings
const double kMobilePadding = 16.0;
const double kTabletPadding = 24.0;
const double kDesktopPadding = 32.0;

// Font sizes
const double kMobileHeadingSize = 24.0;
const double kTabletHeadingSize = 28.0;
const double kDesktopHeadingSize = 32.0;

const double kMobileBodySize = 14.0;
const double kTabletBodySize = 16.0;
const double kDesktopBodySize = 18.0;