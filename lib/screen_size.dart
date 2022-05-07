import 'package:flutter/material.dart';

class ScreenSize {
  ScreenSize(this.context);
  final BuildContext context;

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  double get ratio => context.size!.aspectRatio;

  double get maxMobileWidth => 480;
  double get maxMobileLSWidth => 767;
  double get maxTabledWidth => 1024;
  double get maxLaptopWidth => 1280;
  double get maxDesktopWidth => 1281;

  /// Screen max width mobile devices (Potrait)
  bool isMobile({double decrease = 0}) => width <= (maxMobileWidth - decrease);

  /// Screen max width mobile devices (Landscape)
  bool isMobileLS({double decrease = 0}) =>
      width > (maxMobileWidth - decrease) &&
      width <= (maxMobileLSWidth - decrease);

  /// Screen max width Tablets, Ipads
  bool isTablet({double decrease = 0}) =>
      width > (maxMobileLSWidth - decrease) &&
      width <= (maxTabledWidth - decrease);

  /// Screen max width Laptop
  bool isLaptop({double decrease = 0}) =>
      width > (maxTabledWidth - decrease) &&
      width <= (maxLaptopWidth - decrease);

  // Screen max width Desktop
  bool isDestop({double decrease = 0}) => width > (maxLaptopWidth - decrease);
}
