//
//  handy_extensions
//  iterable
//
//  Created by Ngonidzashe Mangudya on 16/02/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

extension HandyIterableExtension<T> on Iterable<T> {
  /// **intersperse**
  ///
  /// Intersperse a list with a given separator
  ///
  /// Usage:
  /// ```dart
  /// List<String> words = ["Hello", "World", "Name", "Is", "World"]
  /// words.intersperse(" ")
  /// ```
  ///
  /// Result:
  /// ```
  /// ["Hello", " ", "World", " ", "Name", " ", "Is", " ", "World"]
  /// ```
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
}
