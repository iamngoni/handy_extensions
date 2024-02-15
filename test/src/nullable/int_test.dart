//
//  handy_extensions
//  int_test
//
//  Created by Ngonidzashe Mangudya on 15/02/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/src/nullable/int.dart';

void main() {
  group('NullableInt', () {
    test('isInt returns true if the int is not null', () {
      const int num = 5;
      expect(num.isInt, true);
    });

    test('isInt returns false if the int is null', () {
      const int? num = null;
      expect(num.isInt, false);
    });
  });
}
