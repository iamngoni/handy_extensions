//
//  handy_extensions
//  string_test
//
//  Created by Ngonidzashe Mangudya on 15/02/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/handy_extensions.dart';

void main() {
  test('titleCase', () {
    expect('handy extensions'.titleCase, 'Handy extensions');
  });

  test('headingCase', () {
    expect('handy extensions'.headingCase, 'Handy Extensions');
  });

  test('countryEmoji', () {
    expect('ZW'.countryEmoji, '🇿🇼');
  });

  group('isNumeric', () {
    test('fail', () {
      expect('ZW'.isNumeric, false);
    });

    test('success', () {
      expect('1'.isNumeric, true);
    });
  });

  group('toDoubleOrNull', () {
    test('fail', () {
      expect('ZW'.toDoubleOrNull, null);
    });

    test('success', () {
      expect('1'.toDoubleOrNull, 1);
    });
  });

  group('toIntOrNull', () {
    test('fail', () {
      expect('ZW'.toIntOrNull, null);
    });

    test('success', () {
      expect('1'.toIntOrNull, 1);
    });
  });
}
