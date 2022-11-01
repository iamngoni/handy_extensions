import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/handy_extensions.dart';

void main() {
  test("titleCase", () {
    expect("handy extensions".titleCase, "Handy extensions");
  });

  test("headingCase", () {
    expect("handy extensions".headingCase, "Handy Extensions");
  });

  test("countryEmoji", () {
    expect("ZW".countryEmoji, "🇿🇼");
  });
}
