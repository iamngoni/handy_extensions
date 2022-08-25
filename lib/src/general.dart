extension HandyGeneralExtensions<T> on T {
  /// let
  ///
  /// Takes a function and executes it by using the caller
  /// as the parameter
  ///
  /// For example
  ///
  /// int add(a) {
  ///   return a + 1;
  /// }
  ///
  /// 2.let(add)
  /// This should result in 3
  R let<R>(R Function(T) function) => function(this);

  /// Is Null
  ///
  /// Check is given value is null or not
  bool get isNull => this == null;
}
