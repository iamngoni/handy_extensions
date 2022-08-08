extension HandyListExtensions<E> on List<E> {
  List<List<E>> partition({int chunkSize = 2}) {
    List<List<E>> chunks = [];

    for (int i = 0; i < length; i += chunkSize) {
      chunks.add(sublist(i, (i + chunkSize) > length ? length : (i + chunkSize))
          .toList());
    }

    return chunks;
  }

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
