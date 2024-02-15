//
//  context
//  handy_extensions
//
//  Created by Ngonidzashe Mangudya on 12/10/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';

extension HandyContextExtension on BuildContext {
  /// Height
  ///
  /// Returns height of device screen (y-axis)
  double get height => MediaQuery.of(this).size.height;

  /// Width
  ///
  /// Returns width of device screen (x-axis)
  double get width => MediaQuery.of(this).size.width;
}
