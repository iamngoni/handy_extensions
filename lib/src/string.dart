extension HandyStringExtension on String {
  /// Returns a new string with the flag of the specified country code.
  String get countryEmoji {
    List<String> characters = toUpperCase().split('');
    Iterable<int> characterCodes =
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
    List<String> words = split(' ');
    for (String word in words) {
      words[words.indexOf(word)] = word.titleCase;
    }

    return words.join(' ');
  }

  /// **md5**
  ///
  /// Create md5 hash from string
  ///
  /// Usage:
  /// ```dart
  /// String name = "abcdefghiklmnopqrstuvwxyz";
  /// String md5hash = name.md5;
  /// ```
  /// TODO: implement md5 hashing here
  String get md5 {
    return "";
  }
}
