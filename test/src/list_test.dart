import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/handy_extensions.dart';

void main() {
  test('partition', () {
    expect([1, 2, 3, 4, 5, 6].partition(chunkSize: 2), [
      [1, 2],
      [3, 4],
      [5, 6]
    ]);
  });

  test('same', () {
    final List<int> list1 = [1, 2, 3];
    final List<int> list2 = [3, 2, 1];

    expect(list1.same(list2), true);
  });

  test('randomItem', () {
    final List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    expect(list.randomItem(), isNotNull);
  });

  test('randomItems', () {
    final List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    expect(list.randomItems(count: 5), isNotNull);
    expect(list.randomItems(count: 5).length, 5);
  });

  test('firstWhereOrNull', () {
    expect([1, 2, 3].firstWhereOrNull((e) => e == 2), 2);
    expect([1, 2, 3].firstWhereOrNull((e) => e == 4), null);
  });

  test('groupBy', () {
    expect([1, 2, 3, 4, 5, 6].groupBy((e) => e.isEven), {
      true: [2, 4, 6],
      false: [1, 3, 5]
    });
    expect(
      [
        {'title': 'Avengers', 'release_date': '10/01/2019'},
        {'title': 'Creed', 'release_date': '10/01/2019'},
        {'title': 'Jumanji', 'release_date': '30/10/2019'},
      ].groupBy((m) => m['release_date']),
      {
        '10/01/2019': [
          {'title': 'Avengers', 'release_date': '10/01/2019'},
          {'title': 'Creed', 'release_date': '10/01/2019'}
        ],
        '30/10/2019': [
          {'title': 'Jumanji', 'release_date': '30/10/2019'},
        ]
      },
    );
  });

  test('swap', () {
    final List<String> words = ['Hello', 'World']..swap(0, 1);
    expect(words, ['World', 'Hello']);
  });

  test('swapRange', () {
    final List<String> words = ['Hello', 'World', 'How', 'Are', 'You']
      ..swapRange(0, 2, 3);
    expect(words, ['Are', 'You', 'How', 'Hello', 'World']);
  });

  test('hasDuplicates', () {
    expect([1, 2, 3, 4, 5, 6].hasDuplicates(), false);
    expect([1, 2, 3, 4, 5, 6, 1].hasDuplicates(), true);
  });

  test('splitInto', () {
    expect([1, 2, 3, 4, 5, 6].splitInto(chunkSize: 2), [
      [1, 2, 3],
      [4, 5, 6],
    ]);
  });
}
