//
//  num
//  handy_extensions
//
//  Created by Ngonidzashe Mangudya on 12/10/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

extension HandyNumExtension on num {
  /// **microseconds**
  ///
  /// Returns a [Duration] with the given number of microseconds.
  Duration get microseconds => Duration(microseconds: toInt());

  /// **milliseconds**
  ///
  /// Returns a [Duration] with the given number of milliseconds.
  Duration get milliseconds => Duration(milliseconds: toInt());

  /// **seconds**
  ///
  /// Returns a [Duration] with the given number of seconds.
  Duration get seconds => Duration(seconds: toInt());

  /// **minutes**
  ///
  /// Returns a [Duration] with the given number of minutes.
  Duration get minutes => Duration(minutes: toInt());

  /// **hours**
  ///
  /// Returns a [Duration] with the given number of hours.
  Duration get hours => Duration(hours: toInt());

  /// **days**
  ///
  /// Returns a [Duration] with the given number of days.
  Duration get days => Duration(days: toInt());

  /// **weeks**
  ///
  /// Returns a [Duration] with the given number of weeks.
  Duration get weeks => Duration(days: toInt() * 7);

  bool isBetween(num lower, num upper) {
    return lower.compareTo(upper) == 1;
  }
}
