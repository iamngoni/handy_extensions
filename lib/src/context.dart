//
//  context
//  handy_extensions
//
//  Created by Ngonidzashe Mangudya on 12/10/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';

extension HandyContextExtension on BuildContext {
  /// Returns the height of the device screen.
  ///
  /// This getter provides a convenient way to access the height of the device's
  /// screen (along the y-axis) using the current [BuildContext].
  ///
  /// Example:
  /// ```dart
  /// double screenHeight = context.height;
  /// ```
  ///
  /// Returns a [double] representing the screen height in logical pixels.
  double get height => MediaQuery.of(this).size.height;

  /// Returns the width of the device screen.
  ///
  /// This getter provides a convenient way to access the width of the device's
  /// screen (along the x-axis) using the current [BuildContext].
  ///
  /// Example:
  /// ```dart
  /// double screenWidth = context.width;
  /// ```
  ///
  /// Returns a [double] representing the screen width in logical pixels.
  double get width => MediaQuery.of(this).size.width;
}
