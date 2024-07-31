//
//  datetime
//  handy_extensions
//
//  Created by Ngonidzashe Mangudya on 12/10/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'utils/constants.dart';
import 'utils/format_time.dart';

extension HandyDateTimeExtension on DateTime {
  /// Returns a human-readable date string.
  ///
  /// The format is "Day Date Month Year" (e.g., "Tuesday 1 January 2022").
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2022, 1, 1);
  /// print(date.readableDate); // Output: Saturday 1 January 2022
  /// ```
  ///
  /// Returns a [String] representing the date in a readable format.
  String get readableDate => '$getDay $getDate $getMonth $getYear';

  /// Returns a human-readable date and time string.
  ///
  /// The format is "Month Date, Year HH:MM:SS" (e.g., "January 12, 2022 08:00:15").
  ///
  /// Example:
  /// ```dart
  /// final dateTime = DateTime(2022, 1, 12, 8, 0, 15);
  /// print(dateTime.readableDateTime); // Output: January 12, 2022 08:00:15
  /// ```
  ///
  /// Returns a [String] representing the date and time in a readable format.
  String get readableDateTime =>
      "$getMonth $getDate, $getYear ${hour.toString().padLeft(2, '0')}:"
      "${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}";

  /// Returns a readable time string.
  ///
  /// The format is "HH:MM:SS" (e.g., "08:00:34").
  ///
  /// Example:
  /// ```dart
  /// final time = DateTime(2022, 1, 1, 8, 0, 34);
  /// print(time.readableTime); // Output: 08:00:34
  /// ```
  ///
  /// Returns a [String] representing the time in a readable format.
  String get readableTime =>
      "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:"
      "${second.toString().padLeft(2, '0')}";

  /// Returns the full name of the day of the week.
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2022, 1, 1);
  /// print(date.getDay); // Output: Saturday
  /// ```
  ///
  /// Returns a [String] representing the full name of the day.
  String get getDay => weekday == 7
      ? DateConstants.days[0].day
      : DateConstants.days[weekday].day;

  /// Returns the abbreviated name of the day of the week (first 3 letters).
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2022, 1, 1);
  /// print(date.getShortDay); // Output: Sat
  /// ```
  ///
  /// Returns a [String] representing the abbreviated day name.
  String get getShortDay => getDay.substring(0, 3);

  /// Returns the day of the month.
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2022, 1, 15);
  /// print(date.getDate); // Output: 15
  /// ```
  ///
  /// Returns an [int] representing the day of the month.
  int get getDate => day;

  /// Returns the full name of the month.
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2022, 3, 1);
  /// print(date.getMonth); // Output: March
  /// ```
  ///
  /// Returns a [String] representing the full name of the month.
  String get getMonth => DateConstants.months[month - 1].month;

  /// Returns the abbreviated name of the month (first 3 letters).
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2022, 3, 1);
  /// print(date.getShortMonth); // Output: Mar
  /// ```
  ///
  /// Returns a [String] representing the abbreviated month name.
  String get getShortMonth => getMonth.substring(0, 3);

  /// Returns the year as a string.
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2022, 1, 1);
  /// print(date.getYear); // Output: 2022
  /// ```
  ///
  /// Returns a [String] representing the year.
  String get getYear => '$year';

  /// Returns a string representing the time difference from now.
  ///
  /// The format can be "Xd" for days, "Xh" for hours, "Xm" for minutes,
  /// "Xs" for seconds, or "Just now" for very recent times.
  ///
  /// Example:
  /// ```dart
  /// final now = DateTime.now();
  /// final pastTime = now.subtract(Duration(hours: 3));
  /// print(pastTime.timeAgo); // Output: 3h
  ///
  /// final futureTime = now.add(Duration(days: 2));
  /// print(futureTime.timeAgo); // Output: 2d remaining
  /// ```
  ///
  /// Returns a [String] representing the time difference.
  String get timeAgo {
    final currentTime = DateTime.now();
    final difference = currentTime.difference(this);

    if (difference.inDays < 0) {
      return '${difference.inDays.abs()}d remaining';
    }

    if (difference.inDays >= 1) {
      return '${difference.inDays}d';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes}m';
    } else if (difference.inSeconds >= 1) {
      return '${difference.inSeconds}s';
    } else {
      return 'Just now';
    }
  }

  /// Returns a string representing the time of day.
  ///
  /// Possible values: "Morning", "Afternoon", "Evening", "Night"
  ///
  /// Example:
  /// ```dart
  /// final morning = DateTime(2022, 1, 1, 9, 0);
  /// print(morning.timeOfDayStr); // Output: Morning
  ///
  /// final evening = DateTime(2022, 1, 1, 18, 0);
  /// print(evening.timeOfDayStr); // Output: Evening
  /// ```
  ///
  /// Returns a [String] representing the time of day.
  String get timeOfDayStr {
    if (hour >= 0 && hour < 12) {
      return 'Morning';
    } else if (hour >= 12 && hour < 16) {
      return 'Afternoon';
    } else if (hour >= 16 && hour < 20) {
      return 'Evening';
    } else {
      return 'Night';
    }
  }

  /// Returns an emoji representing the time of day.
  ///
  /// Possible values: "🌤️" (for morning and afternoon), "🌙" (for evening and night)
  ///
  /// Example:
  /// ```dart
  /// final morning = DateTime(2022, 1, 1, 9, 0);
  /// print(morning.timeOfDayEmoji); // Output: 🌤️
  ///
  /// final night = DateTime(2022, 1, 1, 22, 0);
  /// print(night.timeOfDayEmoji); // Output: 🌙
  /// ```
  ///
  /// Returns a [String] containing an emoji representing the time of day.
  String get timeOfDayEmoji {
    if (hour >= 0 && hour < 16) {
      return '🌤️';
    } else {
      return '🌙';
    }
  }

  /// Checks if this date is between two other dates.
  ///
  /// This method returns true if this date is after [start] and before [end].
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2022, 6, 15);
  /// final start = DateTime(2022, 1, 1);
  /// final end = DateTime(2022, 12, 31);
  /// print(date.isBetween(start, end)); // Output: true
  ///
  /// final outOfRange = DateTime(2023, 1, 1);
  /// print(outOfRange.isBetween(start, end)); // Output: false
  /// ```
  ///
  /// Parameters:
  ///   - [start]: The start date of the range.
  ///   - [end]: The end date of the range.
  ///
  /// Returns a [bool] indicating whether this date is within the given range.
  bool isBetween(DateTime start, DateTime end) {
    return isAfter(start) && isBefore(end);
  }

  /// Returns time string in the format HH:MMam/pm.
  ///
  /// Example:
  /// ```dart
  /// final time = DateTime(2022, 1, 1, 14, 30);
  /// print(time.timeFormat); // Output: 02:30pm
  /// ```
  ///
  /// Returns a [String] representing the time in HH:MMam/pm format.
  String get timeFormat {
    return formatTime(this);
  }

  /// Returns a readable date and time string.
  ///
  /// The format is "Day Date Month Year, HH:MMam/pm"
  /// (e.g., "Tuesday 1 January 2022, 08:00pm").
  ///
  /// Example:
  /// ```dart
  /// final dateTime = DateTime(2022, 1, 1, 20, 0);
  /// print(dateTime.readableDateTimeFormat);
  /// // Output: Saturday 1 January 2022, 08:00pm
  /// ```
  ///
  /// Returns a [String] representing the date and time in a readable format.
  String get readableDateTimeFormat {
    return '$readableDate, $timeFormat';
  }

  /// Returns a concise description of the date relative to now.
  ///
  /// The format can be:
  /// - Time (HH:MMam/pm) for today
  /// - "Yesterday" for yesterday
  /// - Day name for dates within the last week
  /// - "Date/Month/Year" for older dates
  ///
  /// Example:
  /// ```dart
  /// final now = DateTime.now();
  /// print(now.describe); // Output: current time (e.g., 03:30pm)
  ///
  /// final yesterday = now.subtract(Duration(days: 1));
  /// print(yesterday.describe); // Output: Yesterday
  ///
  /// final lastWeek = now.subtract(Duration(days: 6));
  /// print(lastWeek.describe); // Output: day name (e.g., Monday)
  ///
  /// final oldDate = DateTime(2021, 12, 1);
  /// print(oldDate.describe); // Output: 1/12/2021
  /// ```
  ///
  /// Returns a [String] describing the date relative to now.
  String get describe {
    final DateTime now = DateTime.now();
    final difference = now.difference(this).inDays;
    if (difference == 0) {
      return timeFormat;
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference <= 7) {
      return getDay;
    } else {
      return '$getDate/$getMonth/$getYear';
    }
  }

  /// Checks if this date is the same day as [other], ignoring time.
  ///
  /// Example:
  /// ```dart
  /// final date1 = DateTime(2022, 1, 1, 9, 0);
  /// final date2 = DateTime(2022, 1, 1, 18, 0);
  /// print(date1.isSameDayForYear(date2)); // Output: true
  ///
  /// final date3 = DateTime(2023, 1, 1);
  /// print(date1.isSameDayForYear(date3)); // Output: false
  /// ```
  ///
  /// Parameters:
  ///   - [other]: The date to compare with.
  ///
  /// Returns a [bool] indicating whether the dates are on the same day of the same year.
  bool isSameDayForYear(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// Checks if this date is the same day and month as [other], ignoring year and time.
  ///
  /// Example:
  /// ```dart
  /// final date1 = DateTime(2022, 1, 1);
  /// final date2 = DateTime(2023, 1, 1);
  /// print(date1.isSameDay(date2)); // Output: true
  ///
  /// final date3 = DateTime(2022, 2, 1);
  /// print(date1.isSameDay(date3)); // Output: false
  /// ```
  ///
  /// Parameters:
  ///   - [other]: The date to compare with.
  ///
  /// Returns a [bool] indicating whether the dates are on the same day and month.
  bool isSameDay(DateTime other) {
    return month == other.month && day == other.day;
  }
}
