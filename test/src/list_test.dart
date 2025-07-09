//
//  handy_extensions
//  list_test
//
//  Created by Ngonidzashe Mangudya on 15/02/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/handy_extensions.dart';

import 'models/test_models.dart';

void main() {
  test('partition', () {
    expect([1, 2, 3, 4, 5, 6].partition(chunkSize: 2), [
      [1, 2],
      [3, 4],
      [5, 6],
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
      false: [1, 3, 5],
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
          {'title': 'Creed', 'release_date': '10/01/2019'},
        ],
        '30/10/2019': [
          {'title': 'Jumanji', 'release_date': '30/10/2019'},
        ],
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
    final List<String> interests = [
      'Innovation',
      'Lifestyle',
      'Fashion',
      'Business',
      'Travel & Tourism',
      'Sports',
      'Entertainment',
      'Research & Education',
      'Agriculture',
      'Health & Fitness',
      'Politics',
      'History & Culture',
      'Technology',
      'Science',
      'Finance',
      'Food & Drink',
      'Music',
      'Arts & Crafts',
      'Gaming',
    ];
    final List<List<String>> chunks = interests.splitInto(chunkSize: 3);
    expect(chunks.length, 3);
    expect(chunks[0].length, 6);
    expect(chunks[1].length, 6);
    expect(chunks[2].length, 7);
  });

  test('containsSome', () {
    final List<String> interests = [
      'Innovation',
      'Lifestyle',
      'Fashion',
      'Business',
      'Travel & Tourism',
      'Sports',
      'Entertainment',
      'Research & Education',
      'Agriculture',
      'Health & Fitness',
      'Politics',
      'History & Culture',
      'Technology',
      'Science',
      'Finance',
      'Food & Drink',
      'Music',
      'Arts & Crafts',
      'Gaming',
    ];
    final List<String> selectedInterests = ['Innovation', 'Fashion', 'Music'];
    expect(interests.containsSome(selectedInterests), true);
  });

  test('partitionWhere', () {
    final List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    final List<List<int>> partitioned = numbers.partitionWhere((e) => e.isEven);
    expect(partitioned[0], [2, 4, 6, 8, 10]);
    expect(partitioned[1], [1, 3, 5, 7, 9]);
  });

  group('updateWhere', () {
    test('updates matching elements in a number list', () {
      final numbers = [1, 2, 3, 4, 5]..updateWhere(
          (n) => n.isEven,
          (n) => n * 2,
        );
      expect(numbers, [1, 4, 3, 8, 5]);
    });

    test('handles empty list', () {
      final empty = <int>[]..updateWhere(
          (n) => n.isEven,
          (n) => n * 2,
        );
      expect(empty, isEmpty);
    });

    test('updates string list based on condition', () {
      final words = ['hello', 'world', 'dart', 'flutter']..updateWhere(
          (s) => s.length <= 4,
          (s) => s.toUpperCase(),
        );
      expect(words, ['hello', 'world', 'DART', 'flutter']);
    });

    test('no updates when predicate never matches', () {
      final numbers = [1, 2, 3];
      final originalList = [...numbers];
      numbers.updateWhere(
        (n) => n > 100,
        (n) => n * 2,
      );
      expect(numbers, originalList);
    });

    test('updates all elements when predicate always matches', () {
      final numbers = [1, 2, 3]..updateWhere(
          (n) => true,
          (n) => n + 1,
        );
      expect(numbers, [2, 3, 4]);
    });

    test('handles complex objects', () {
      final people = [
        const Person('Alice', 25),
        const Person('Bob', 30),
        const Person('Charlie', 35),
      ]..updateWhere(
          (p) => p.age > 30,
          (p) => Person(p.name.toUpperCase(), p.age),
        );

      expect(people[0].name, 'Alice');
      expect(people[1].name, 'Bob');
      expect(people[2].name, 'CHARLIE');
    });
  });

  group('firstOrNullWhere', () {
    test('finds first matching non-null element', () {
      final List<int?> numbers = [1, 2, 3, 4];
      final result = numbers.firstOrNullWhere((n) => n != null && n.isEven);
      expect(result, 2);
    });

    test('finds first null element', () {
      final List<int?> numbers = [1, null, 3, null];
      final result = numbers.firstOrNullWhere((n) => n == null);
      expect(result, null);
    });

    test('returns null for no match', () {
      final List<int?> numbers = [1, 3, 5];
      final result = numbers.firstOrNullWhere((n) => n != null && n.isEven);
      expect(result, null);
    });

    test('handles null list', () {
      const List<int?> numbers = [];
      final result = numbers.firstOrNullWhere((n) => n != null);
      expect(result, null);
    });

    test('handles empty list', () {
      final List<int?> numbers = [];
      final result = numbers.firstOrNullWhere((n) => n != null);
      expect(result, null);
    });

    test('works with complex objects', () {
      final List<Person?> people = [
        const Person('Alice', 25),
        null,
        const Person('Bob', 30),
      ];

      final result = people.firstOrNullWhere((p) => p != null && p.age > 28);
      expect(result?.name, 'Bob');
    });
  });

  test('isValidIndex', () {
    final List<int> numbers = [1, 2, 3, 4, 5];
    expect(numbers.isValidIndex(2), true);
    expect(numbers.isValidIndex(5), false);
  });

  test('getAt', () {
    final List<int> numbers = [1, 2, 3, 4, 5];
    expect(numbers.getAt(2), 3);
    expect(numbers.getAt(5), null);
  });

  test('should update matching elements and return true', () {
    final numbers = [1, 2, 3, 4, 5];

    final result = numbers.updateWhereOrCreate(
      (n) => n.isEven,
      (n) => n * 2,
      () => 99,
    );

    expect(result, isTrue);
    expect(numbers, equals([1, 4, 3, 8, 5]));
  });

  test('should create single element when no matches and return false', () {
    final numbers = [1, 3, 5];

    final result = numbers.updateWhereOrCreate(
      (n) => n.isEven,
      (n) => n * 2,
      () => 10,
    );

    expect(result, isFalse);
    expect(numbers, equals([1, 3, 5, 10]));
  });

  test('should work with complex objects', () {
    final users = [
      User(id: 1, name: 'Alice', active: true),
      User(id: 2, name: 'Bob', active: false),
    ];

    final result = users.updateWhereOrCreate(
      (user) => user.active,
      (user) => user.copyWith(name: user.name.toUpperCase()),
      () => User(id: 99, name: 'Default', active: true),
    );

    expect(result, isTrue);
    expect(users.length, equals(2));
    expect(users[0].name, equals('ALICE'));
    expect(users[1].name, equals('Bob')); // unchanged
  });

  test('should create default user when no active users found', () {
    final users = [
      User(id: 1, name: 'Alice', active: false),
      User(id: 2, name: 'Bob', active: false),
    ];

    final result = users.updateWhereOrCreate(
      (user) => user.active,
      (user) => user.copyWith(name: user.name.toUpperCase()),
      () => User(id: 99, name: 'Default', active: true),
    );

    expect(result, isFalse);
    expect(users.length, equals(3));
    expect(users[2].name, equals('Default'));
    expect(users[2].active, isTrue);
  });

  test('should update matching elements and return true', () {
    final scores = [85, 100, 92, 100, 78];

    final result = scores.updateWhereOrCreateMultiple(
      (score) => score == 100,
      (score) => score + 5, // bonus points
      () => [95, 98],
    );

    expect(result, isTrue);
    expect(scores, equals([85, 105, 92, 105, 78]));
  });

  test('should create multiple elements when no matches and return false', () {
    final scores = [85, 92, 78];

    final result = scores.updateWhereOrCreateMultiple(
      (score) => score == 100,
      (score) => score + 5,
      () => [95, 98, 100],
    );

    expect(result, isFalse);
    expect(scores, equals([85, 92, 78, 95, 98, 100]));
  });

  test('should work with strings', () {
    final words = ['hello', 'world'];

    final result = words.updateWhereOrCreateMultiple(
      (word) => word.startsWith('x'),
      (word) => word.toUpperCase(),
      () => ['xenon', 'xray'],
    );

    expect(result, isFalse);
    expect(words, equals(['hello', 'world', 'xenon', 'xray']));
  });

  test('should create empty list when create returns empty', () {
    final numbers = [1, 3, 5];

    final result = numbers.updateWhereOrCreateMultiple(
      (n) => n.isEven,
      (n) => n * 2,
      () => <int>[], // Empty list
    );

    expect(result, isFalse);
    expect(numbers, equals([1, 3, 5])); // No change
  });

  test('should handle empty list', () {
    final List<int> numbers = [];

    final result = numbers.updateWhereOrCreateMultiple(
      (n) => n > 0,
      (n) => n * 2,
      () => [1, 2, 3],
    );

    expect(result, isFalse);
    expect(numbers, equals([1, 2, 3]));
  });

  test('should handle null values in list', () {
    final List<int?> numbers = [1, null, 3, null, 5];

    final result = numbers.updateWhereOrCreate(
      (n) => n == null,
      (n) => 0,
      () => -1,
    );

    expect(result, isTrue);
    expect(numbers, equals([1, 0, 3, 0, 5]));
  });

  test('should preserve order when creating multiple elements', () {
    final letters = ['a', 'b'];

    final result = letters.updateWhereOrCreateMultiple(
      (letter) => letter == 'z',
      (letter) => letter.toUpperCase(),
      () => ['x', 'y', 'z'],
    );

    expect(result, isFalse);
    expect(letters, equals(['a', 'b', 'x', 'y', 'z']));
  });
}
