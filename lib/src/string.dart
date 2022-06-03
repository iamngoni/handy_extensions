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
}
