extension HandyGeneralExtensions<T> on T {
  R let<R>(R Function(T) function) => function(this);
  bool get isNull => this == null;
}
