extension HandyListExtensions<E> on List<E> {
  List<List> partition({int chunkSize = 2}) {
    int listLength = length;
    List<List<E>> chunks = [];

    for (int i = 0; i < listLength; i += chunkSize) {
      chunks.add(sublist(i, i + chunkSize).toList());
    }

    return chunks;
  }
}
