import 'package:flutter/material.dart';

class Responsive {
  static bool isWeb(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 600;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
