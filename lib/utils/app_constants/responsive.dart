import 'package:flutter/material.dart';

class AppResponsive {
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}

const mockupHeight = 812;
const mockupWidth = 375;

/// Returns [function] that generates responsive [height] value
sHeight(BuildContext context) {
  return (dynamic height) {
    double screenHeight = MediaQuery.of(context).size.height;
    return screenHeight * (height / mockupHeight);
  };
}

/// Returns [function] that generates responsive [width] value
sWidth(BuildContext context) {
  return (dynamic width) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * (width / mockupWidth);
  };
}

/// Returns value of the screen [height] or [width]
fullScreen(BuildContext context) {
  return (String? axis) {
    if (axis!.contains('height')) return MediaQuery.of(context).size.height;
    return MediaQuery.of(context).size.width;
  };
}
