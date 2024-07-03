//
//  handy_extensions
//  time_of_day.dart
//
//  Created by Ngonidzashe Mangudya on 03/07/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';

extension HandyTimeOfDayExtension on TimeOfDay {
  /// isBefore
  ///
  /// Returns true if the given [TimeOfDay] is before the current [TimeOfDay]
  ///
  /// Example:
  /// ```dart
  /// TimeOfDay(10, 30).isBefore(TimeOfDay(11, 30)); // true
  /// ```
  ///
  /// Returns `true` if the given [TimeOfDay] is before the current [TimeOfDay]
  ///
  bool isBefore(TimeOfDay time) {
    return hour < time.hour || (hour == time.hour && minute < time.minute);
  }
}
