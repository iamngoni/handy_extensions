import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/handy_extensions.dart';

void main() {
  test("STRING", () {
    expect("handy extensions".titleCase, "Handy extensions");
    expect("handy extensions".headingCase, "Handy Extensions");
    expect("ZW".countryEmoji, "🇿🇼");
  });

  test("DATETIME", () {
    expect(DateTime.now().getYear, "${DateTime.now().year}");
  });

  test("LIST", () {
    expect([1, 2, 3, 4, 5, 6].partition(), [
      [1, 2],
      [3, 4],
      [5, 6]
    ]);
  });
}
