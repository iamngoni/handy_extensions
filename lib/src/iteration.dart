extension HandyIterationExtension<E> on Iterable<E> {
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
