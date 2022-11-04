import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/handy_extensions.dart';

void main() {
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

  test("randomItem", () {
    List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    expect(list.randomItem(), isNotNull);
  });

  test("randomItems", () {
    List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    expect(list.randomItems(count: 5), isNotNull);
    expect(list.randomItems(count: 5).length, 5);
  });

  test("firstWhereOrNull", () {
    expect([1, 2, 3].firstWhereOrNull((e) => e == 2), 2);
    expect([1, 2, 3].firstWhereOrNull((e) => e == 4), null);
  });

  test("groupBy", () {
    expect([1, 2, 3, 4, 5, 6].groupBy((e) => e % 2 == 0), {
      true: [2, 4, 6],
      false: [1, 3, 5]
    });
    expect(
      [
        {"title": "Avengers", "release_date": "10/01/2019"},
        {"title": "Creed", "release_date": "10/01/2019"},
        {"title": "Jumanji", "release_date": "30/10/2019"},
      ].groupBy((m) => m["release_date"]),
      {
        "10/01/2019": [
          {"title": "Avengers", "release_date": "10/01/2019"},
          {"title": "Creed", "release_date": "10/01/2019"}
        ],
        "30/10/2019": [
          {"title": "Jumanji", "release_date": "30/10/2019"},
        ]
      },
    );
  });
}
