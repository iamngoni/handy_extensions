//
//  handy_extensions
//  iterable_test
//
//  Created by Ngonidzashe Mangudya on 16/02/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/handy_extensions.dart';

void main() {
  group('NullableIterable', () {
    test('withoutNullElements', () {
      final nullableList = [1, 2, null, 3, null, 4, 5, null];
      final result = nullableList.withoutNullElements();
      expect(result, [1, 2, 3, 4, 5]);
    });
  });
}
