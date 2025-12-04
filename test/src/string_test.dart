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

  group('isAllCaps', () {
    test('fail', () {
      expect('handy extensions'.isAllCaps, false);
    });

    test('success', () {
      expect('HANDY EXTENSIONS'.isAllCaps, true);
    });
  });

  group('select', () {
    test('removes script tags from string', () {
      const input = 'Check - Check In: Maintenance Due : ZAR 1374.94.'
          '<script type="text/javascript">viewGLAccounts(0,2722896);</script>'
          ' Check In:';
      final result = input.select(start: '<script', end: '</script>')?.remove();
      expect(
          result, 'Check - Check In: Maintenance Due : ZAR 1374.94. Check In:');
    });

    test('returns null when start marker not found', () {
      const input = 'Hello World';
      final result = input.select(start: '<script', end: '</script>');
      expect(result, isNull);
    });

    test('returns null when end marker not found', () {
      const input = 'Hello <script>World';
      final result = input.select(start: '<script>', end: '</script>');
      expect(result, isNull);
    });

    test('selected returns the full selection including markers', () {
      const input = 'Hello <b>World</b> Goodbye';
      final selection = input.select(start: '<b>', end: '</b>');
      expect(selection?.selected, '<b>World</b>');
    });

    test('content returns text between markers', () {
      const input = 'Hello <b>World</b> Goodbye';
      final selection = input.select(start: '<b>', end: '</b>');
      expect(selection?.content('<b>', '</b>'), 'World');
    });

    test('replace substitutes selection with new text', () {
      const input = 'Hello <b>World</b> Goodbye';
      final result =
          input.select(start: '<b>', end: '</b>')?.replace('Universe');
      expect(result, 'Hello Universe Goodbye');
    });

    test('removeAll removes all occurrences', () {
      const input = 'A<x>1</x>B<x>2</x>C';
      final result =
          input.select(start: '<x>', end: '</x>')?.removeAll('<x>', '</x>');
      expect(result, 'ABC');
    });

    test('replaceAll replaces all occurrences', () {
      const input = 'A<x>1</x>B<x>2</x>C';
      final result = input.select(start: '<x>', end: '</x>')?.replaceAll(
            start: '<x>',
            end: '</x>',
            replacement: '[]',
          );
      expect(result, 'A[]B[]C');
    });
  });
}
