import 'package:flutter/material.dart';

extension HandyContextExtension<T> on BuildContext {
  /// Height
  ///
  /// Returns height of device screen (y-axis)
  double get height => MediaQuery.of(this).size.height;

  /// Width
  ///
  /// Returns width of device screen (x-axis)
  double get width => MediaQuery.of(this).size.width;
}
