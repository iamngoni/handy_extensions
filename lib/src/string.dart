//
//  string
//  handy_extensions
//
//  Created by Ngonidzashe Mangudya on 12/10/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

extension HandyStringExtension on String {
  /// Returns a new string with the flag of the specified country code.
  String get countryEmoji {
    final List<String> characters = toUpperCase().split('');
    final Iterable<int> characterCodes =
        characters.map((String char) => 127397 + char.codeUnits.first);
    return String.fromCharCodes(characterCodes);
  }

  /// Return a new string with first character as upper case.
  String get titleCase {
    if (length <= 1) return toUpperCase();

    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Returns a new string with the first character of each word as upper case
  String get headingCase {
    final List<String> words = split(' ');
    for (final String word in words) {
      words[words.indexOf(word)] = word.titleCase;
    }

    return words.join(' ');
  }

  /// Checks whether string is numeric
  bool get isNumeric {
    return double.tryParse(this) != null;
  }
}
