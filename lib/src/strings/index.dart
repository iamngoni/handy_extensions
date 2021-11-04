extension HandyStringExtensions on String {
  String get countryEmoji {
    var codePoints = toUpperCase()
        .split("")
        .map((String char) => 127397 + char.codeUnits.first);
    return String.fromCharCodes(codePoints);
  }
}
