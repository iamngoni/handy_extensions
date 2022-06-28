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

  group("LIST EXTENSIONS", () {
    test("partition", () {
      expect([1, 2, 3, 4, 5, 6].partition(chunkSize: 2), [
        [1, 2],
        [3, 4],
        [5, 6]
      ]);
    });

    test("same", () {
      List<int> list1 = [1, 2, 3];
      List<int> list2 = [3, 2, 1];

      expect(list1.same(list2), true);
    });
  });
}
