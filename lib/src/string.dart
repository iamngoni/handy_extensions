//
//  string
//  handy_extensions
//
//  Created by Ngonidzashe Mangudya on 12/10/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

/// Represents a selection within a string, defined by start and end markers.
///
/// This class allows you to perform operations on a substring that is
/// identified by string markers rather than integer indices.
class StringSelection {
  /// Creates a [StringSelection] with the given source string and selection bounds.
  const StringSelection({
    required this.source,
    required this.startIndex,
    required this.endIndex,
  });

  /// The original source string.
  final String source;

  /// The starting index of the selection (inclusive).
  final int startIndex;

  /// The ending index of the selection (exclusive).
  final int endIndex;

  /// Returns the selected substring.
  ///
  /// Example:
  /// ```dart
  /// final selection = 'Hello <b>World</b>'.select(start: '<b>', end: '</b>');
  /// print(selection?.selected); // Output: <b>World</b>
  /// ```
  String get selected => source.substring(startIndex, endIndex);

  /// Returns the content between the start and end markers (excluding the markers).
  ///
  /// Example:
  /// ```dart
  /// final selection = 'Hello <b>World</b>'.select(start: '<b>', end: '</b>');
  /// print(selection?.content); // Output: World
  /// ```
  String content(String start, String end) {
    return source.substring(startIndex + start.length, endIndex - end.length);
  }

  /// Returns a new string with the selected portion removed.
  ///
  /// Example:
  /// ```dart
  /// final result = 'Hello <script>alert(1)</script> World'
  ///     .select(start: '<script', end: '</script>')
  ///     ?.remove();
  /// print(result); // Output: Hello  World
  /// ```
  String remove() {
    return source.substring(0, startIndex) + source.substring(endIndex);
  }

  /// Returns a new string with the selected portion replaced by [replacement].
  ///
  /// Example:
  /// ```dart
  /// final result = 'Hello <b>World</b>'
  ///     .select(start: '<b>', end: '</b>')
  ///     ?.replace('Universe');
  /// print(result); // Output: Hello Universe
  /// ```
  String replace(String replacement) {
    return source.substring(0, startIndex) +
        replacement +
        source.substring(endIndex);
  }

  /// Returns a new string with all occurrences of the selection removed.
  ///
  /// Example:
  /// ```dart
  /// final result = 'A<x>B<x>C'.select(start: '<x>', end: '<x>')?.removeAll();
  /// ```
  String removeAll(String start, String end) {
    String result = source;
    while (true) {
      final selection = result.select(start: start, end: end);
      if (selection == null) break;
      result = selection.remove();
    }
    return result;
  }

  /// Returns a new string with all occurrences of the selection replaced.
  ///
  /// Example:
  /// ```dart
  /// final result = 'A<x>1</x>B<x>2</x>C'
  ///     .select(start: '<x>', end: '</x>')
  ///     ?.replaceAll(start: '<x>', end: '</x>', replacement: '[]');
  /// print(result); // Output: A[]B[]C
  /// ```
  String replaceAll({
    required String start,
    required String end,
    required String replacement,
  }) {
    String result = source;
    while (true) {
      final selection = result.select(start: start, end: end);
      if (selection == null) break;
      result = selection.replace(replacement);
    }
    return result;
  }
}

extension HandyStringExtension on String {
  /// Converts this string (assumed to be a country code) to a country flag emoji.
  ///
  /// This method assumes the string is a two-letter country code and converts
  /// it to the corresponding country flag emoji.
  ///
  /// Example:
  /// ```dart
  /// print('US'.countryEmoji); // Output: 🇺🇸
  /// print('GB'.countryEmoji); // Output: 🇬🇧
  /// ```
  ///
  /// Returns a [String] representing the country flag emoji.
  String get countryEmoji {
    final List<String> characters = toUpperCase().split('');
    final Iterable<int> characterCodes =
        characters.map((String char) => 127397 + char.codeUnits.first);
    return String.fromCharCodes(characterCodes);
  }

  /// Converts the first character of this string to uppercase.
  ///
  /// If the string is empty or has only one character, it returns the uppercase
  /// version of the entire string.
  ///
  /// Example:
  /// ```dart
  /// print('hello'.titleCase); // Output: Hello
  /// print('a'.titleCase);     // Output: A
  /// print(''.titleCase);      // Output: (empty string)
  /// ```
  ///
  /// Returns a new [String] with the first character in uppercase.
  String get titleCase {
    if (length <= 1) return toUpperCase();
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Converts the first character of each word in this string to uppercase.
  ///
  /// This method splits the string by spaces and applies [titleCase] to each word.
  ///
  /// Example:
  /// ```dart
  /// print('hello world'.headingCase); // Output: Hello World
  /// print('THE QUICK BROWN FOX'.headingCase); // Output: The Quick Brown Fox
  /// ```
  ///
  /// Returns a new [String] with the first character of each word in uppercase.
  String get headingCase {
    final List<String> words = split(' ');
    for (final String word in words) {
      words[words.indexOf(word)] = word.titleCase;
    }
    return words.join(' ');
  }

  /// Checks whether this string represents a numeric value.
  ///
  /// This method attempts to parse the string as a double. If successful,
  /// it returns true; otherwise, it returns false.
  ///
  /// Example:
  /// ```dart
  /// print('123'.isNumeric);   // Output: true
  /// print('12.34'.isNumeric); // Output: true
  /// print('12a'.isNumeric);   // Output: false
  /// ```
  ///
  /// Returns a [bool] indicating whether the string is numeric.
  bool get isNumeric {
    return double.tryParse(this) != null;
  }

  /// Attempts to parse this string as a double.
  ///
  /// If the string can be parsed as a double, it returns the parsed value.
  /// Otherwise, it returns null.
  ///
  /// Example:
  /// ```dart
  /// print('123.45'.toDoubleOrNull);  // Output: 123.45
  /// print('abc'.toDoubleOrNull);     // Output: null
  /// ```
  ///
  /// Returns a [double?] representing the parsed value or null.
  double? get toDoubleOrNull {
    return double.tryParse(this);
  }

  /// Attempts to parse this string as an integer.
  ///
  /// If the string can be parsed as an integer, it returns the parsed value.
  /// Otherwise, it returns null.
  ///
  /// Example:
  /// ```dart
  /// print('123'.toIntOrNull);  // Output: 123
  /// print('12.34'.toIntOrNull); // Output: null
  /// print('abc'.toIntOrNull);   // Output: null
  /// ```
  ///
  /// Returns an [int?] representing the parsed value or null.
  int? get toIntOrNull {
    return int.tryParse(this);
  }

  /// Checks if this string matches another string, ignoring case.
  ///
  /// This method compares the lowercase version of both strings.
  ///
  /// Example:
  /// ```dart
  /// print('Hello'.matches('hello')); // Output: true
  /// print('World'.matches('earth')); // Output: false
  /// ```
  ///
  /// Parameters:
  ///   - [input]: The string to compare with.
  ///
  /// Returns a [bool] indicating whether the strings match (ignoring case).
  bool matches(String input) {
    return toLowerCase().trim() == input.toLowerCase().trim();
  }

  /// Checks if this string is in all uppercase.
  ///
  /// This method compares the string with its uppercase version.
  ///
  /// Example:
  /// ```dart
  /// print('HELLO'.isAllCaps); // Output: true
  /// print('Hello'.isAllCaps); // Output: false
  /// ```
  ///
  /// Returns a [bool] indicating whether the string is in all uppercase.
  bool get isAllCaps {
    return this == toUpperCase();
  }

  /// Returns whether this string contains exactly the same characters as
  /// [input], regardless of their order.
  ///
  /// The comparison is case sensitive and ignores whitespace. For example:
  /// ```dart
  /// 'hello'.hasSameCharacters('olleh');    // true
  /// 'hello'.hasSameCharacters('HELLO');    // false
  /// 'hello'.hasSameCharacters('world');    // false
  /// ```
  ///
  /// This method uses [matches] internally after sorting the characters,
  /// so the strings are compared in a case-sensitive manner without leading
  /// or trailing whitespace.
  bool hasSameCharacters(String input) {
    final List<String> characters = split('');
    final List<String> inputCharacters = input.split('');
    characters.sort();
    inputCharacters.sort();
    return characters.join().matches(inputCharacters.join());
  }

  /// Selects a portion of this string between [start] and [end] markers.
  ///
  /// Returns a [StringSelection] that allows you to perform operations
  /// like [StringSelection.remove], [StringSelection.replace], etc.
  ///
  /// Returns `null` if the [start] or [end] markers are not found, or if
  /// [end] appears before [start].
  ///
  /// Example:
  /// ```dart
  /// final input = 'Check - Check In: Maintenance Due : ZAR 1374.94.'
  ///     '<script type="text/javascript">viewGLAccounts(0,2722896);</script>'
  ///     ' Check In:';
  ///
  /// final result = input.select(start: '<script', end: '</script>')?.remove();
  /// print(result);
  /// // Output: Check - Check In: Maintenance Due : ZAR 1374.94. Check In:
  /// ```
  ///
  /// Parameters:
  ///   - [start]: The string marking the beginning of the selection.
  ///   - [end]: The string marking the end of the selection.
  ///
  /// Returns a [StringSelection] or `null` if markers are not found.
  StringSelection? select({required String start, required String end}) {
    final startIndex = indexOf(start);
    if (startIndex == -1) return null;

    final endIndex = indexOf(end, startIndex + start.length);
    if (endIndex == -1) return null;

    return StringSelection(
      source: this,
      startIndex: startIndex,
      endIndex: endIndex + end.length,
    );
  }
}
