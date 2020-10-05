import 'package:flutter/material.dart';

class SizeConfig {
  static double yMargin(BuildContext context, double height) {
    double screenHeight = MediaQuery.of(context).size.height / 100;
    return height * screenHeight;
  }

  static double xMargin(BuildContext context, double width) {
    double screenWidth = MediaQuery.of(context).size.width / 100;
    return width * screenWidth;
  }

  static double textSize(BuildContext context, double textSize) {
    double screenHeight = MediaQuery.of(context).size.height / 100;
    double screenWidth = MediaQuery.of(context).size.width / 100;
    if (screenWidth > screenHeight) return textSize * screenHeight;
    return textSize * screenWidth;
  }
}
