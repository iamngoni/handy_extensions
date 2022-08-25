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
}
