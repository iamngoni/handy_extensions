//
//  handy_extensions
//  time_of_day_test.dart
//
//  Created by Ngonidzashe Mangudya on 03/07/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/handy_extensions.dart';

void main() {
  test('isBefore', () {
    expect(
      const TimeOfDay(hour: 10, minute: 30)
          .isBefore(const TimeOfDay(hour: 11, minute: 30)),
      true,
    );
  });
}
