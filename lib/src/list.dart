import 'dart:math';

extension HandyListExtensions<E> on List<E> {
  /// **partition**
  ///
  /// Splits a [List] into the separate list chunks depending on the
  /// specified [chunkSize]. Chunk size will default to 2
  ///
  /// Usage:
  /// ```dart
  /// List<String> words = ["Hello", "World", "Name", "Is", "Ngoni"]
  /// List<List<String>> partitionedWords = words.partition(chunkSize: 2)
  /// ```
  /// Result:
  /// ```
  /// [["Hello", "World"], ["Name", "Is"], ["Ngoni"]]
  /// ```
  List<List<E>> partition({int chunkSize = 2}) {
    List<List<E>> chunks = [];

    for (int i = 0; i < length; i += chunkSize) {
      chunks.add(sublist(i, (i + chunkSize) > length ? length : (i + chunkSize))
          .toList());
    }

    return chunks;
  }

  // TODO: partitionWhen
  // TODO: multiSortMethods

  /// **same**
  ///
  /// Basically checks if two lists / arrays are the same
  /// despite being ordered differently i.e. if they have the same equal elements
  ///
  /// Usage:
  /// ```dart
  /// List<String> words = ["Hello", "World"]
  /// List<String> otherWords = ["World", "Hello"]
  /// print(words.same(otherWords))
  /// ```
  /// Result:
  /// ```
  /// true
  /// ```
  bool same(List<E> items) {
    if (length != items.length) return false;
    bool isTheSame = true;

    for (E item in items) {
      if (!contains(item)) {
        isTheSame = false;
      }
    }

    return isTheSame;
  }

  /// **randomItem**
  ///
  /// Return random item from the list.
  ///
  /// Usage:
  /// ```dart
  /// List<String> words = ["Hello", "World", "Name", "Is", "Ngoni"]
  /// String randomWord = words.randomItem()
  /// ```
  E randomItem() {
    return this[Random().nextInt(length)];
  }

  /// **randomItems**
  ///
  /// Return random items from the list.
  ///
  /// Usage:
  /// ```dart
  /// List<String> words = ["Hello", "World", "Name", "Is", "Ngoni"]
  /// List<String> randomWords = words.randomItems(count: 2)
  /// ```
  List<E> randomItems({int count = 1}) {
    List<E> items = [];

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

  ///  **firstWhereOrNull**
  ///
  /// Tries to find an element [E] using the given condition
  /// else it will return null.
  ///
  /// Usage:
  /// ```dart
  /// List<String> items = ["Hello", "World"];
  /// String? word = items.firstWhereOrNull((String element) => element == "Hello")
  /// ```
  E? firstWhereOrNull(bool Function(E) test) {
    for (E element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  /// **groupBy**
  ///
  /// Group list elements into a map  using the given
  /// condition.
  ///
  /// Usage:
  /// ```dart
  ///   [
  ///      {"title";: "Avengers", "release_date": "10/01/2019"},
  ///      {"title": "Creed", "release_date": "10/01/2019"},
  ///      {"title": "Jumanji", "release_date": "30/10/2019"},
  ///   ].groupBy((m) => m["release_date"])
  /// ```
  /// Result:
  /// ```json
  ///   {
  ///      "10/01/2019": [
  ///        {"title": "Avengers", "release_date": "10/01/2019"},
  ///        {"title": "Creed", "release_date": "10/01/2019"}
  ///      ],
  ///      "30/10/2019": [
  ///        {"title": "Jumanji", "release_date": "30/10/2019"},
  ///      ]
  ///   }
  /// ```
  Map<T, List<E>> groupBy<T>(T Function(E) keyFunction) {
    return fold(
      <T, List<E>>{},
      (Map<T, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element),
    );
  }

  /// **swap**
  ///
  /// Swap items in list
  ///
  /// Usage:
  /// ```dart
  /// List<String> words = ["Hello", "World", "Name", "Is", "Ngoni"]
  /// words.swap(0, 3)
  /// ```
  ///
  /// Result:
  /// ```
  /// ["Name", "World", "Hello", "Is", "Ngoni"]
  /// ```
  void swap(int index1, int index2) {
    final E tmp = this[index1];
    this[index1] = this[index2];
    this[index2] = tmp;
  }

  /// **swapRange**
  ///
  /// Swap items in list using the given range
  ///
  /// Usage:
  /// ```dart
  /// List<String> words = ["Hello", "World", "Name", "Is", "Ngoni"]
  /// words.swapRange(0, 3, 2)
  /// ```
  ///
  /// Result:
  /// ```
  /// ["Name", "World", "Hello", "Is", "Ngoni"]
  /// ```
  void swapRange(int start, int end, int newStart) {
    List<E> tmp = sublist(start, end);
    replaceRange(start, end, sublist(newStart, newStart + (end - start)));
    replaceRange(newStart, newStart + (end - start), tmp);
  }

  /// **hasDuplicates**
  ///
  /// Checks if there are any duplicates in the list
  ///
  /// Usage:
  /// ```dart
  /// List<String> words = ["Hello", "World", "Name", "Is", "World"]
  /// words.hasDuplicates()
  /// ```
  ///
  /// Result:
  /// ```
  /// true
  /// ```
  bool hasDuplicates() {
    return length != toSet().length;
  }

  /// **splitInto**
  ///
  /// Splits a list into a list of lists
  ///
  /// Usage:
  /// ```dart
  /// List<String> words = ["Hello", "World", "Name", "Is", "World"]
  /// words.splitInto(chunkSize: 2)
  /// ```
  ///
  /// Result:
  /// ```
  /// [["Hello", "World"], ["Name", "Is", "World"]]
  /// ```
  List<List<E>> splitInto({int chunkSize = 2}) {
    List<List<E>> subLists = [];
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
}
