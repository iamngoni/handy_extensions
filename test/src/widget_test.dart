//
//  handy_extensions
//  widget
//
//  Created by Ngonidzashe Mangudya on 16/02/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/handy_extensions.dart';

void main() {
  group('HandyWidgetExtensions', () {
    test('inkWell should return InkWell widget', () {
      final widget = Container().inkWell(
        onTap: () {},
        hapticFeedbackType: HapticFeedbackType.light,
      );

      expect(widget, isA<InkWell>());
    });

    test('inkWell should call onTap when tapped', () {
      var tapped = false;
      final widget = Container().inkWell(
        onTap: () {
          tapped = true;
        },
        hapticFeedbackType: HapticFeedbackType.light,
      );

      expect(tapped, false);
      widget.onTap!();
      expect(tapped, true);
    });
  });
}
