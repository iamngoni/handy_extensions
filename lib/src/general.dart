//
//
//  general
//  handy_extensions
//
//  Created by Ngonidzashe Mangudya on 12/10/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

extension HandyGeneralExtensions<T> on T {
  /// Applies a function to this value and returns the result.
  ///
  /// This method allows you to chain operations on a value without introducing
  /// a new variable. It's particularly useful for performing operations on
  /// the result of an expression.
  ///
  /// Example:
  /// ```dart
  /// int add(int a) {
  ///   return a + 1;
  /// }
  ///
  /// final result = 2.let(add);
  /// print(result); // Output: 3
  ///
  /// // You can also use it with anonymous functions:
  /// final squared = 4.let((it) => it * it);
  /// print(squared); // Output: 16
  /// ```
  ///
  /// Parameters:
  ///   - [function]: A function that takes a value of type [T] and returns a
  ///   value of type [R].
  ///
  /// Returns:
  ///   The result of applying [function] to this value, which is of type [R].
  R let<R>(R Function(T) function) => function(this);

  /// Checks if this value is null.
  ///
  /// This getter provides a convenient way to check for null values,
  /// especially useful in null-safe Dart where `== null` checks are not
  /// always allowed.
  ///
  /// Example:
  /// ```dart
  /// String? nullableString;
  /// print(nullableString.isNull); // Output: true
  ///
  /// String nonNullString = "Hello";
  /// print(nonNullString.isNull); // Output: false
  /// ```
  ///
  /// Returns:
  ///   A [bool] indicating whether this value is null (`true`) or not
  ///   (`false`).
  bool get isNull => this == null;
}
