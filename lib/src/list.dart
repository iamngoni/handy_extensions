extension HandyListExtensions<E> on List<E> {
  List<List> partition({int chunkSize = 2}) {
    List<List<E>> chunks = [];

    for (int i = 0; i < length; i += chunkSize) {
      chunks.add(sublist(i, (i + chunkSize) > length ? length : (i + chunkSize)).toList());
    }

    return chunks;
  }
}
