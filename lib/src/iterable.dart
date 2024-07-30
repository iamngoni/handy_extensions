//
//  handy_extensions
//  iterable
//
//  Created by Ngonidzashe Mangudya on 16/02/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

extension HandyIterableExtension<T> on Iterable<T> {
  /// Intersperses the elements of the iterable with a given separator.
  ///
  /// This method inserts the [separator] between each pair of adjacent elements
  /// in the original iterable.
  ///
  /// Example:
  /// ```dart
  /// final words = ["Hello", "World", "Dart"];
  /// final result = words.intersperse(",");
  /// print(result.toList()); // Output: [Hello, ,, World, ,, Dart]
  /// ```
  ///
  /// Returns an [Iterable] containing the original elements interspersed with
  /// the separator.
  Iterable<T> intersperse(T separator) sync* {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield separator;
        yield iterator.current;
      }
    }
  }

  /// Intersperses the elements of the iterable with separators generated by a
  /// function.
  ///
  /// This method calls the [separator] function for each element (except the
  /// first) and inserts the result between each pair of adjacent elements in
  /// the original iterable. If the separator function returns null for an
  /// element, no separator is inserted before that element.
  ///
  /// Example:
  /// ```dart
  /// final numbers = [1, 2, 3, 4, 5];
  /// final result = numbers.intersperseWith((n) => n.isEven ? ':' : null);
  /// print(result.toList()); // Output: [1, 2, :, 3, 4, :, 5]
  /// ```
  ///
  /// Returns an [Iterable] containing the original elements interspersed with
  /// the generated separators.
  Iterable<T> intersperseWith(T? Function(T) separator) sync* {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        final t = separator(iterator.current);
        if (t != null) yield t;
        yield iterator.current;
      }
    }
  }

  /// Inserts a separator at a specific index in the iterable.
  ///
  /// This method inserts the [separator] after the element at the specified
  /// [index]. If the index is out of range, the separator is not inserted.
  ///
  /// Example:
  /// ```dart
  /// final letters = ['A', 'B', 'C', 'D'];
  /// final result = letters.intersperseAt(1, '-');
  /// print(result.toList()); // Output: [A, B, -, C, D]
  /// ```
  ///
  /// Returns an [Iterable] containing the original elements with the separator
  /// inserted at the specified index.
  Iterable<T> intersperseAt(int index, T separator) sync* {
    final iterator = this.iterator;
    var i = 0;
    while (iterator.moveNext()) {
      if (i == index) {
        yield separator;
      }
      yield iterator.current;
      i++;
    }
  }
}
