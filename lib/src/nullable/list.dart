//
//  handy_extensions
//  list
//
//  Created by Ngonidzashe Mangudya on 19/12/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

extension NullableList<T> on List<T>? {
  /// Returns the first element that satisfies the given predicate [fn],
  /// or null if no element matches or if the list is null/empty.
  ///
  /// The predicate [fn] is applied to each element until a match is found.
  ///
  /// Example:
  /// ```dart
  /// final List<int>? numbers = [1, 2, 3, 4];
  ///
  /// // Find first even number
  /// final even = numbers.firstOrNullWhere((n) => n.isEven); // 2
  ///
  /// // No match found
  /// final big = numbers.firstOrNullWhere((n) => n > 10); // null
  ///
  /// // Null list
  /// final List<int>? nullList = null;
  /// final result = nullList.firstOrNullWhere((n) => n > 0); // null
  /// ```
  T? firstOrNullWhere(bool Function(T) fn) {
    if (this == null) return null;

    for (final element in this!) {
      if (fn(element)) {
        return element;
      }
    }
    return null;
  }

  /// Returns `null` if the list is null or empty, otherwise returns the list itself.
  ///
  /// This is useful when you want to treat empty lists the same as null lists,
  /// particularly when using null-coalescing operators (`??`, `??=`).
  ///
  /// **Returns:**
  /// - `null` if the list is `null` or has zero elements
  /// - The original list if it contains one or more elements
  ///
  /// **Example:**
  /// ```dart
  /// List<String>? names = [];
  /// List<String>? result = names.nullIfEmpty; // Returns null
  ///
  /// List<String>? validNames = ['Alice', 'Bob'];
  /// List<String>? validResult = validNames.nullIfEmpty; // Returns ['Alice', 'Bob']
  ///
  /// // Useful with null-coalescing assignment
  /// response.items = response.items.nullIfEmpty ?? defaultItems;
  /// ```
  ///
  /// **Use Cases:**
  /// - Converting empty lists to null for cleaner null-coalescing operations
  /// - Standardizing null/empty checks in data transfer objects
  /// - Simplifying conditional assignments where empty should be treated as null
  ///
  /// **Performance:** O(1) - only checks the length property
  List<T>? get nullIfEmpty => this == null || this!.isEmpty ? null : this;
}
