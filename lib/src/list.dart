import 'dart:math';

extension HandyListExtensions<E> on List<E> {
  /// Partition
  ///
  /// Splits a [List] into the separate list chunks depending on the
  /// specified [chunkSize]. Chunk size will default to 2
  List<List<E>> partition({int chunkSize = 2}) {
    List<List<E>> chunks = [];

    for (int i = 0; i < length; i += chunkSize) {
      chunks.add(sublist(i, (i + chunkSize) > length ? length : (i + chunkSize))
          .toList());
    }

    return chunks;
  }

  /// Same
  ///
  /// Basically checks if two lists / arrays are the same
  /// despite being ordered differently i.e. if they have the same equal elements
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

  /// Random Item
  ///
  /// Returns a random item from the list
  E randomItem() {
    return this[Random().nextInt(length)];
  }

  /// Random Items
  ///
  /// Returns a list of random items from the list without duplicates
  List<E> randomItems({int count = 1}) {
    List<E> items = [];

    for (int i = 0; i < count; i++) {
      E item = randomItem();

      if (items.contains(item)) {
        i--;
      } else {
        items.add(item);
      }
    }

    return items;
  }

  E? firstWhereOrNull(bool Function(E) test) {
    for (E element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  Map<T, List<E>> groupBy<T>(T Function(E) keyFunction) {
    return fold(
      <T, List<E>>{},
      (Map<T, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element),
    );
  }
}
