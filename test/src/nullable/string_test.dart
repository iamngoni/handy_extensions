//
//  handy_extensions
//  string_test
//
//  Created by Ngonidzashe Mangudya on 15/02/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/src/nullable/string.dart';

void main() {
  group('NullableString', () {
    test('isString returns true if the string is not null', () {
      const String str = 'Hello';
      expect(str.isString, true);
    });

    test('isString returns false if the string is null', () {
      const String? str = null;
      expect(str.isString, false);
    });

    test('orEmpty returns the string if it is not null', () {
      const String str = 'Hello';
      expect(str.orEmpty, 'Hello');
    });

    test('orEmpty returns an empty string if the string is null', () {
      const String? str = null;
      expect(str.orEmpty, '');
    });

    test(
        'isNotReallyEmpty returns true if the string is not null and not empty',
        () {
      const String str = 'Hello';
      expect(str.isNotReallyEmpty, true);
    });

    test('isNotReallyEmpty returns false if the string is null or empty', () {
      String? str = '';
      expect(str.isNotReallyEmpty, false);

      str = null;
      expect(str.isNotReallyEmpty, false);
    });
  });
}
