extension HandyIntExtension on int {
  /// **microseconds**
  ///
  /// Returns a [Duration] with the given number of microseconds.
  Duration get microseconds => Duration(microseconds: this);

  /// **milliseconds**
  ///
  /// Returns a [Duration] with the given number of milliseconds.
  Duration get milliseconds => Duration(milliseconds: this);

  /// **seconds**
  ///
  /// Returns a [Duration] with the given number of seconds.
  Duration get seconds => Duration(seconds: this);

  /// **minutes**
  ///
  /// Returns a [Duration] with the given number of minutes.
  Duration get minutes => Duration(minutes: this);

  /// **hours**
  ///
  /// Returns a [Duration] with the given number of hours.
  Duration get hours => Duration(hours: this);

  /// **days**
  ///
  /// Returns a [Duration] with the given number of days.
  Duration get days => Duration(days: this);

  /// **weeks**
  ///
  /// Returns a [Duration] with the given number of weeks.
  Duration get weeks => Duration(days: this * 7);
}
