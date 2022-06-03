import 'package:flutter/material.dart';

extension HandyContextExtension on BuildContext {
  /// Height of device screen (y-axis)
  double get height => MediaQuery.of(this).size.height;

  /// Width of device screen (x-axis)
  double get width => MediaQuery.of(this).size.width;
}
