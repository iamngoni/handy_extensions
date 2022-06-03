extension HandyStringExtension on String {
  /// Returns a new string with the flag of the specified country code.
  String get countryEmoji {
    List<String> characters = toUpperCase().split('');
    Iterable<int> characterCodes =
        characters.map((String char) => 127397 + char.codeUnits.first);
    return String.fromCharCodes(characterCodes);
  }
}
