import 'package:flutter/material.dart';

class SizeProvider {
  static late MediaQueryData mediaQueryData;
  static late Orientation orientation;
  static late double heightRatio;
  static late double widthRatio;

  init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    orientation = mediaQueryData.orientation;
    Size size = mediaQueryData.size;
    heightRatio = size.height / 751;
    widthRatio = size.width / 361;
  }
}

extension ResponsiveSizeProvider on int {
  double get height => this * SizeProvider.heightRatio;
  double get width => this * SizeProvider.widthRatio;
}
