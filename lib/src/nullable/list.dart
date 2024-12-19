//
//  handy_extensions
//  list
//
//  Created by Ngonidzashe Mangudya on 19/12/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

extension NullableList<T> on List<T?> {
  /// Returns the first element that satisfies the given predicate [fn],
  /// or null if no element matches or if the list is null/empty.
  ///
  /// The predicate [fn] is applied to each element (which may itself be null)
  /// until a match is found.
  ///
  /// Example:
  /// ```dart
  /// final List<int?> numbers = [1, null, 3, 4];
  ///
  /// // Find first even number
  /// final even = numbers.firstOrNullWhere((n) => n != null && n.isEven); // 4
  ///
  /// // Find first null
  /// final firstNull = numbers.firstOrNullWhere((n) => n == null); // null
  /// ```
  T? firstOrNullWhere(bool Function(T?) fn) {
    for (final element in this) {
      if (fn(element)) {
        return element;
      }
    }
    return null;
  }
}
