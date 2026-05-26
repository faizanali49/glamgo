import 'package:flutter/material.dart';

class AppSizes {
  // Screen Padding Defaults
  static const double screenPadding = 24.0;
  
  // Element Border Radius Defaults
  static const double radiusLarge = 24.0;
  static const double radiusMedium = 16.0;
  static const double radiusSmall = 12.0;
  static const double radiusButton = 30.0;

  // Constant Layout Spacers (Saves memory over instantiating repeating sizedboxes)
  static const SizedBox h8 = SizedBox(height: 8);
  static const SizedBox h12 = SizedBox(height: 12);
  static const SizedBox h24 = SizedBox(height: 24);
  static const SizedBox h32 = SizedBox(height: 32);
  static const SizedBox h40 = SizedBox(height: 40);
  
  static const SizedBox w4 = SizedBox(width: 4);
  static const SizedBox w8 = SizedBox(width: 8);
  static const SizedBox w12 = SizedBox(width: 12);
}