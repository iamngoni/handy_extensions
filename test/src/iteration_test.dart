import "package:flutter_test/flutter_test.dart";
import "package:handy_extensions/handy_extensions.dart";

void main() {
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
