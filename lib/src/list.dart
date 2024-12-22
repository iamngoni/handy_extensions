//
//  list
//  handy_extensions
//
//  Created by Ngonidzashe Mangudya on 12/10/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'dart:math';

extension HandyListExtensions<E> on List<E> {
  /// Splits a [List] into separate list chunks of the specified [chunkSize].
  ///
  /// If the list length is not evenly divisible by [chunkSize], the last chunk
  /// will contain the remaining elements.
  ///
  /// Example:
  /// ```dart
  /// final words = ["Hello", "World", "Name", "Is", "Ngoni"];
  /// final partitionedWords = words.partition(chunkSize: 2);
  /// print(partitionedWords);
  /// // Output: [["Hello", "World"], ["Name", "Is"], ["Ngoni"]]
  /// ```
  ///
  /// Parameters:
  ///   - [chunkSize]: The size of each chunk. Defaults to 2.
  ///
  /// Returns a [List<List<E>>] containing the partitioned chunks.
  List<List<E>> partition({int chunkSize = 2}) {
    final List<List<E>> chunks = [];

    for (int i = 0; i < length; i += chunkSize) {
      chunks.add(
        sublist(i, (i + chunkSize) > length ? length : (i + chunkSize))
            .toList(),
      );
    }

    return chunks;
  }

  /// Partitions a list into two lists based on a predicate.
  ///
  /// Example:
  /// ```dart
  /// final words = ["Hello", "World", "Name", "Is", "Ngoni"];
  /// final partitionedWords = words.partitionWhere((word) => word.length > 3);
  /// print(partitionedWords);
  /// // Output: [["Hello", "World", "Ngoni"], ["Name", "Is"]]
  /// ```
  ///
  /// Parameters:
  ///  - [fn]: The predicate used to partition the list.
  ///
  /// Returns a [List<List<E>>] containing two lists: one with elements that
  /// satisfy the predicate and one with elements that do not. The first list
  /// contains elements that satisfy the predicate, while the second list
  /// contains elements that do not.
  List<List<E>> partitionWhere(bool Function(E) fn) {
    final List<E> meetsRequirements = [];
    final List<E> doesNotMeetRequirements = [];

    for (final E element in this) {
      if (fn(element)) {
        meetsRequirements.add(element);
      } else {
        doesNotMeetRequirements.add(element);
      }
    }

    return [meetsRequirements, doesNotMeetRequirements];
  }

  /// Checks if two lists contain the same elements, regardless of order.
  ///
  /// Example:
  /// ```dart
  /// final words = ["Hello", "World"];
  /// final otherWords = ["World", "Hello"];
  /// print(words.same(otherWords)); // Output: true
  /// ```
  ///
  /// Parameters:
  ///   - [items]: The list to compare with.
  ///
  /// Returns a [bool] indicating whether the lists contain the same elements.
  bool same(List<E> items) {
    if (length != items.length) return false;
    bool isTheSame = true;

    for (final E item in items) {
      if (!contains(item)) {
        isTheSame = false;
      }
    }

    return isTheSame;
  }

  /// Returns a random item from the list.
  ///
  /// Example:
  /// ```dart
  /// final words = ["Hello", "World", "Name", "Is", "Ngoni"];
  /// final randomWord = words.randomItem();
  /// print(randomWord); // Output: A random word from the list
  /// ```
  ///
  /// Returns a random element [E] from the list.
  E randomItem() {
    return this[Random().nextInt(length)];
  }

  /// Returns a list of random items from the list.
  ///
  /// The returned list will not contain duplicate items.
  ///
  /// Example:
  /// ```dart
  /// final words = ["Hello", "World", "Name", "Is", "Ngoni"];
  /// final randomWords = words.randomItems(count: 2);
  /// print(randomWords); // Output: Two random words from the list
  /// ```
  ///
  /// Parameters:
  ///   - [count]: The number of random items to return. Defaults to 1.
  ///
  /// Returns a [List<E>] containing [count] random elements from the list.
  List<E> randomItems({int count = 1}) {
    final List<E> items = [];

    for (int i = 0; i < count; i++) {
      final E item = randomItem();

      if (items.contains(item)) {
        i--;
      } else {
        items.add(item);
      }
    }

    return items;
  }

  /// Returns the first element that satisfies the given predicate,
  /// or null if no element satisfies the predicate.
  ///
  /// Example:
  /// ```dart
  /// final items = ["Hello", "World"];
  /// final word = items.firstWhereOrNull((element) => element == "Hello");
  /// print(word); // Output: Hello
  /// ```
  ///
  /// Parameters:
  ///   - [test]: A function that returns true for the desired element.
  ///
  /// Returns the first matching element, or null if no match is found.
  E? firstWhereOrNull(bool Function(E) test) {
    for (final E element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  /// Groups list elements into a map using the given key function.
  ///
  /// Example:
  /// ```dart
  /// final movies = [
  ///   {"title": "Avengers", "release_date": "10/01/2019"},
  ///   {"title": "Creed", "release_date": "10/01/2019"},
  ///   {"title": "Jumanji", "release_date": "30/10/2019"},
  /// ];
  /// final grouped = movies.groupBy((m) => m["release_date"]);
  /// print(grouped);
  /// // Output: {
  /// //   "10/01/2019": [
  /// //     {"title": "Avengers", "release_date": "10/01/2019"},
  /// //     {"title": "Creed", "release_date": "10/01/2019"}
  /// //   ],
  /// //   "30/10/2019": [
  /// //     {"title": "Jumanji", "release_date": "30/10/2019"},
  /// //   ]
  /// // }
  /// ```
  ///
  /// Parameters:
  ///   - [keyFunction]: A function that returns the key for each element.
  ///
  /// Returns a [Map<T, List<E>>] where each key is the result of [keyFunction]
  /// and each value is a list of elements that produced that key.
  Map<T, List<E>> groupBy<T>(T Function(E) keyFunction) {
    return fold(
      <T, List<E>>{},
      (Map<T, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element),
    );
  }

  /// Swaps two items in the list.
  ///
  /// Example:
  /// ```dart
  /// final words = ["Hello", "World", "Name", "Is", "Ngoni"];
  /// words.swap(0, 3);
  /// print(words); // Output: ["Is", "World", "Name", "Hello", "Ngoni"]
  /// ```
  ///
  /// Parameters:
  ///   - [index1]: The index of the first item to swap.
  ///   - [index2]: The index of the second item to swap.
  void swap(int index1, int index2) {
    final E tmp = this[index1];
    this[index1] = this[index2];
    this[index2] = tmp;
  }

  /// Swaps a range of items in the list with another range.
  ///
  /// Example:
  /// ```dart
  /// final words = ["Hello", "World", "Name", "Is", "Ngoni"];
  /// words.swapRange(0, 2, 3);
  /// print(words); // Output: ["Is", "Ngoni", "Name", "Hello", "World"]
  /// ```
  ///
  /// Parameters:
  ///   - [start]: The start index of the first range.
  ///   - [end]: The end index (exclusive) of the first range.
  ///   - [newStart]: The start index of the second range.
  void swapRange(int start, int end, int newStart) {
    final List<E> tmp = sublist(start, end);
    replaceRange(start, end, sublist(newStart, newStart + (end - start)));
    replaceRange(newStart, newStart + (end - start), tmp);
  }

  /// Checks if there are any duplicates in the list.
  ///
  /// Example:
  /// ```dart
  /// final words = ["Hello", "World", "Name", "Is", "World"];
  /// print(words.hasDuplicates()); // Output: true
  /// ```
  ///
  /// Returns a [bool] indicating whether the list contains duplicates.
  bool hasDuplicates() {
    return length != toSet().length;
  }

  /// Splits a list into a list of lists of the specified size.
  ///
  /// If the list length is not evenly divisible by [chunkSize], the last chunk
  /// will contain the remaining elements.
  ///
  /// Example:
  /// ```dart
  /// final words = ["Hello", "World", "Name", "Is", "Ngoni"];
  /// final split = words.splitInto(chunkSize: 2);
  /// print(split); // Output: [["Hello", "World"], ["Name", "Is"], ["Ngoni"]]
  /// ```
  ///
  /// Parameters:
  ///   - [chunkSize]: The size of each chunk. Defaults to 2.
  ///
  /// Returns a [List<List<E>>] containing the split chunks.
  List<List<E>> splitInto({int chunkSize = 2}) {
    final List<List<E>> subLists = [];
    final int size = length;
    final int minLengthForEachSubList = size ~/ chunkSize;

    for (int i = 0; i < chunkSize; i++) {
      final int start = i * minLengthForEachSubList;
      int end = (i + 1) * minLengthForEachSubList;
      if (i == chunkSize - 1) {
        end = size;
      }
      subLists.add(sublist(start, end));
    }
    return subLists;
  }

  /// Checks if the list contains any of the items in the given list.
  ///
  /// Example:
  /// ```dart
  /// final words = ["Hello", "World", "Name", "Is", "Ngoni"];
  /// print(words.containsSome(["Hello", "Goodbye"])); // Output: true
  /// ```
  ///
  /// Parameters:
  ///   - [items]: The list of items to check for.
  ///
  /// Returns a [bool] indicating whether any of the items are present in the
  /// list.
  bool containsSome(List<E> items) {
    return items.any(contains);
  }

  /// Updates elements in the list that match the given predicate function.
  ///
  /// Takes two functions:
  /// - [fn] is a predicate that returns true for elements that should be updated
  /// - [update] transforms matching elements to their new values
  ///
  /// Example:
  /// ```dart
  /// final numbers = [1, 2, 3, 4, 5];
  ///
  /// // Double all even numbers
  /// numbers.updateWhere(
  ///   (n) => n.isEven,
  ///   (n) => n * 2
  /// );
  /// // Result: [1, 4, 3, 8, 5]
  /// ```
  ///
  /// The original list is modified in place. Elements are updated by applying
  /// the [update] function to each element where [fn] returns true.
  void updateWhere(bool Function(E) fn, E Function(E) update) {
    for (int i = 0; i < length; i++) {
      if (fn(this[i])) {
        this[i] = update(this[i]);
      }
    }
  }

  /// Checks if the given [index] is valid for this list.
  ///
  /// Returns `true` if the index is within the bounds of the list,
  /// `false` otherwise.
  ///
  /// An index is considered valid if it:
  /// - Is non-negative (>= 0)
  /// - Is less than the list length
  ///
  /// Example:
  /// ```dart
  /// var numbers = [1, 2, 3];
  /// print(numbers.isValidIndex(1)); // true
  /// print(numbers.isValidIndex(3)); // false
  /// print(numbers.isValidIndex(-1)); // false
  /// ```
  bool isValidIndex(int index) {
    return index >= 0 && index < length;
  }
}
