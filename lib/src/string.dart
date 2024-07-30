//
//  string
//  handy_extensions
//
//  Created by Ngonidzashe Mangudya on 12/10/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

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
    return toLowerCase() == input.toLowerCase();
  }
}
