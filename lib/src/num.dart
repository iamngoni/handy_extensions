//
//  num
//  handy_extensions
//
//  Created by Ngonidzashe Mangudya on 12/10/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

extension HandyNumExtension on num {
  /// Converts this number to a [Duration] representing microseconds.
  ///
  /// Example:
  /// ```dart
  /// final duration = 500.microseconds;
  /// print(duration); // Output: 0:00:00.000500
  /// ```
  ///
  /// Returns a [Duration] with this number of microseconds.
  Duration get microseconds => Duration(microseconds: round());

  /// Converts this number to a [Duration] representing milliseconds.
  ///
  /// Example:
  /// ```dart
  /// final duration = 1500.ms;
  /// print(duration); // Output: 0:00:01.500000
  /// ```
  ///
  /// Returns a [Duration] with this number of milliseconds.
  Duration get ms => Duration(milliseconds: round());

  /// Converts this number to a [Duration] representing milliseconds.
  ///
  /// Example:
  /// ```dart
  /// final duration = 1500.milliseconds;
  /// print(duration); // Output: 0:00:01.500000
  /// ```
  ///
  /// Returns a [Duration] with this number of milliseconds.
  Duration get milliseconds => Duration(milliseconds: round());

  /// Converts this number to a [Duration] representing seconds.
  ///
  /// Example:
  /// ```dart
  /// final duration = 90.seconds;
  /// print(duration); // Output: 0:01:30.000000
  /// ```
  ///
  /// Returns a [Duration] with this number of seconds.
  Duration get seconds => Duration(seconds: round());

  /// Converts this number to a [Duration] representing minutes.
  ///
  /// Example:
  /// ```dart
  /// final duration = 5.minutes;
  /// print(duration); // Output: 0:05:00.000000
  /// ```
  ///
  /// Returns a [Duration] with this number of minutes.
  Duration get minutes => Duration(minutes: round());

  /// Converts this number to a [Duration] representing hours.
  ///
  /// Example:
  /// ```dart
  /// final duration = 2.hours;
  /// print(duration); // Output: 2:00:00.000000
  /// ```
  ///
  /// Returns a [Duration] with this number of hours.
  Duration get hours => Duration(hours: round());

  /// Converts this number to a [Duration] representing days.
  ///
  /// Example:
  /// ```dart
  /// final duration = 3.days;
  /// print(duration); // Output: 72:00:00.000000
  /// ```
  ///
  /// Returns a [Duration] with this number of days.
  Duration get days => Duration(days: round());

  /// Converts this number to a [Duration] representing weeks.
  ///
  /// This assumes 7 days per week.
  ///
  /// Example:
  /// ```dart
  /// final duration = 2.weeks;
  /// print(duration); // Output: 336:00:00.000000
  /// ```
  ///
  /// Returns a [Duration] with this number of weeks.
  Duration get weeks => Duration(days: 7 * round());

  /// Converts this number to a [Duration] representing months.
  ///
  /// This assumes 30 days per month for simplicity.
  ///
  /// Example:
  /// ```dart
  /// final duration = 1.months;
  /// print(duration); // Output: 720:00:00.000000
  /// ```
  ///
  /// Returns a [Duration] with this number of months (approximated).
  Duration get months => Duration(days: (30.44 * this).round());

  /// Converts this number to a [Duration] representing years.
  ///
  /// This assumes 365 days per year for simplicity (not accounting for leap years).
  ///
  /// Example:
  /// ```dart
  /// final duration = 1.years;
  /// print(duration); // Output: 8760:00:00.000000
  /// ```
  ///
  /// Returns a [Duration] with this number of years (approximated).
  Duration get years {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final targetDate = DateTime(today.year - round(), today.month, today.day);
    return today.difference(targetDate);
  }

  /// Checks if this number is between two other numbers.
  ///
  /// Note: This method seems to have an implementation error. The current
  /// implementation always returns true when lower is greater than upper.
  /// A correct implementation would be:
  /// `return this >= lower && this <= upper;`
  ///
  /// Example:
  /// ```dart
  /// print(5.isBetween(1, 10)); // Should output: true
  /// print(15.isBetween(1, 10)); // Should output: false
  /// ```
  ///
  /// Parameters:
  ///   - [lower]: The lower bound of the range.
  ///   - [upper]: The upper bound of the range.
  ///
  /// Returns a [bool] indicating whether this number is between [lower] and
  /// [upper].
  bool isBetween(num lower, num upper) {
    return this >= lower && this <= upper;
  }
}
