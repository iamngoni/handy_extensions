import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/handy_extensions.dart';

import '../models/test_models.dart';

void main() {
  group('NullableList.nullIfEmpty', () {
    test('returns null when list is null', () {
      const List<String>? nullList = null;
      expect(nullList?.nullIfEmpty, isNull);
    });

    test('returns null when list is empty', () {
      final List<String> emptyList = [];
      expect(emptyList.nullIfEmpty, isNull);
    });

    test('returns original list when list has one element', () {
      final List<String> singleItemList = ['item'];
      expect(singleItemList.nullIfEmpty, equals(['item']));
      expect(singleItemList.nullIfEmpty, same(singleItemList));
    });

    test('returns original list when list has multiple elements', () {
      final List<String> multiItemList = ['item1', 'item2', 'item3'];
      expect(multiItemList.nullIfEmpty, equals(['item1', 'item2', 'item3']));
      expect(multiItemList.nullIfEmpty, same(multiItemList));
    });

    test('works with different types', () {
      // Test with integers
      final List<int> intList = [1, 2, 3];
      expect(intList.nullIfEmpty, equals([1, 2, 3]));

      final List<int> emptyIntList = [];
      expect(emptyIntList.nullIfEmpty, isNull);

      // Test with custom objects
      final List<Person> personList = [
        const Person(
          'Alice',
          10,
        ),
        const Person(
          'Bob',
          10,
        )
      ];
      expect(personList.nullIfEmpty, hasLength(2));

      final List<Person> emptyPersonList = [];
      expect(emptyPersonList.nullIfEmpty, isNull);
    });

    test('works with null-coalescing operator', () {
      final List<String> emptyList = [];
      final List<String> defaultList = ['default'];

      final List<String> result = emptyList.nullIfEmpty ?? defaultList;
      expect(result, equals(['default']));
    });

    test('works with null-coalescing assignment operator', () {
      List<String>? targetList = [];
      final List<String> sourceList = ['source1', 'source2'];

      targetList = targetList.nullIfEmpty ?? sourceList;
      expect(targetList, equals(['source1', 'source2']));
    });

    test('chaining with other operations', () {
      List<String>? list = [];
      String? firstItem = list.nullIfEmpty?.first;
      expect(firstItem, isNull);

      list = ['item1', 'item2'];
      firstItem = list.nullIfEmpty?.first;
      expect(firstItem, equals('item1'));
    });

    test('performance - does not modify original list', () {
      final List<String> originalList = ['item1', 'item2'];
      final List<String> nullableList = originalList;

      final List<String>? result = nullableList.nullIfEmpty;

      expect(identical(result, originalList), isTrue);
      expect(originalList, equals(['item1', 'item2'])); // Unchanged
    });
  });

  group('NullableList.firstOrNullWhere', () {
    test('returns null when list is null', () {
      final List<String>? nullList = null;
      final String? result =
          nullList.firstOrNullWhere((item) => item == 'test');
      expect(result, isNull);
    });

    test('returns null when list is empty', () {
      final List<String> emptyList = [];
      final String? result =
          emptyList.firstOrNullWhere((item) => item == 'test');
      expect(result, isNull);
    });

    test('returns first matching element', () {
      final List<int> numbers = [1, 2, 3, 4, 5];
      final int? result = numbers.firstOrNullWhere((n) => n.isEven);
      expect(result, equals(2));
    });

    test('returns null when no elements match', () {
      final List<int> numbers = [1, 3, 5, 7];
      final int? result = numbers.firstOrNullWhere((n) => n.isEven);
      expect(result, isNull);
    });

    test('returns first match when multiple elements match', () {
      final List<String> words = ['apple', 'banana', 'apricot', 'cherry'];
      final String? result =
          words.firstOrNullWhere((word) => word.startsWith('a'));
      expect(result, equals('apple')); // First match, not 'apricot'
    });

    test('works with different data types', () {
      // Test with strings
      final List<String> fruits = ['apple', 'banana', 'cherry'];
      final String? result =
          fruits.firstOrNullWhere((fruit) => fruit.length > 5);
      expect(result, equals('banana'));

      // Test with doubles
      final List<double> prices = [1.99, 2.50, 0.99, 4.75];
      final double? cheapItem = prices.firstOrNullWhere((price) => price < 1.0);
      expect(cheapItem, equals(0.99));
    });

    test('works with custom objects', () {
      final List<Person> people = [
        const Person('Alice', 25),
        const Person('Bob', 30),
        const Person('Charlie', 22),
      ];

      final Person? adult =
          people.firstOrNullWhere((person) => person.age >= 30);
      expect(adult?.name, equals('Bob'));

      final Person? senior =
          people.firstOrNullWhere((person) => person.age >= 65);
      expect(senior, isNull);
    });

    test('predicate can access all element properties', () {
      final List<Product> products = [
        Product('Laptop', 999.99, 'Electronics'),
        Product('Book', 19.99, 'Education'),
        Product('Phone', 699.99, 'Electronics'),
      ];

      final Product? cheapElectronics = products.firstOrNullWhere(
        (product) => product.category == 'Electronics' && product.price < 800,
      );
      expect(cheapElectronics?.name, equals('Phone'));
    });

    test('handles complex predicates', () {
      final List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

      // Find first number divisible by both 2 and 3
      final int? result =
          numbers.firstOrNullWhere((n) => n % 2 == 0 && n % 3 == 0);
      expect(result, equals(6));
    });

    test('predicate is called in order and stops at first match', () {
      final List<int> numbers = [1, 2, 3, 4, 5];
      final List<int> checkedNumbers = [];

      final int? result = numbers.firstOrNullWhere((n) {
        checkedNumbers.add(n);
        return n > 2;
      });

      expect(result, equals(3));
      expect(checkedNumbers, equals([1, 2, 3])); // Should stop after finding 3
    });

    test('works with single element list', () {
      final List<String> singleItem = ['hello'];

      final String? found =
          singleItem.firstOrNullWhere((item) => item == 'hello');
      expect(found, equals('hello'));

      final String? notFound =
          singleItem.firstOrNullWhere((item) => item == 'world');
      expect(notFound, isNull);
    });

    test('handles edge cases with predicates', () {
      final List<String> words = ['', 'a', 'ab', 'abc'];

      // Find first empty string
      final String? empty = words.firstOrNullWhere((word) => word.isEmpty);
      expect(empty, equals(''));

      // Find first string with specific length
      final String? twoChars =
          words.firstOrNullWhere((word) => word.length == 2);
      expect(twoChars, equals('ab'));
    });

    test('performance - stops at first match', () {
      // Create a large list to verify it stops early
      final List<int> largeList = List.generate(1000, (i) => i);

      int callCount = 0;
      final int? result = largeList.firstOrNullWhere((n) {
        callCount++;
        return n == 5;
      });

      expect(result, equals(5));
      expect(callCount, equals(6)); // Should only check elements 0-5
    });

    test('works with boolean predicates', () {
      final List<bool> booleans = [false, false, true, false];
      final bool? firstTrue = booleans.firstOrNullWhere((b) => b);
      expect(firstTrue, isTrue);

      final List<bool> allFalse = [false, false, false];
      final bool? noTrue = allFalse.firstOrNullWhere((b) => b);
      expect(noTrue, isNull);
    });
  });
}
