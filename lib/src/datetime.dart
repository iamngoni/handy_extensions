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
  /// Readable Date
  ///
  /// Returns date string in the format Tuesday 1 January 2022
  String get readableDate => '$getDay $getDate $getMonth $getYear';

  /// Readable DateTime
  ///
  /// Returns date and time string in the format January 12, 2022 08:00:15
  String get readableDateTime =>
      "$getMonth $getDate, $getYear ${hour >= 10 ? hour : "0$hour"}"
      ":${minute >= 10 ? minute : "0$minute"}:${second >= 10 ? second : "0"
          "$second"}";

  /// Readable Time
  ///
  /// Returns time string in the format 08:00:34
  String get readableTime =>
      "${hour >= 10 ? hour : "0$hour"}:${minute >= 10 ? minute : "0$minute"}"
      ":${second >= 10 ? second : "0$second"}";

  /// Get Day
  ///
  /// Returns day string in the format Monday, Tuesday etc
  String get getDay => weekday == 7
      ? DateConstants.days[0].day
      : DateConstants.days[weekday].day;

  /// Get Short Day
  ///
  /// Returns short day string in the format Mon, Tue, Wed etc
  String get getShortDay => getDay.substring(0, 3);

  /// Get Date
  ///
  /// Returns date integer i.e. simply returns .day value of the
  /// given [DateTime]
  int get getDate => day;

  /// Get Month
  ///
  /// Returns month string in the format January, February etc
  String get getMonth => DateConstants.months[month - 1].month;

  /// Get Short Month
  ///
  /// Returns short month string in the format Jan, Feb etc
  String get getShortMonth => getMonth.substring(0, 3);

  /// Get Year
  ///
  /// Returns year in the format 2020, 2021 etc
  String get getYear => '$year';

  /// Time Ago
  ///
  /// Returns string of time difference between given DateTime and
  /// [DateTime.now()] in the format 1d, 2h, 4s or Just now
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

  /// Time Of Day Str
  ///
  /// Returns time of day in the format Morning, Afternoon, Evening or Night
  ///
  /// Usage:
  ///
  /// ```dart
  /// DateTime.now().timeOfDayStr
  /// ```
  ///
  /// Result:
  ///
  /// ```dart
  /// Morning
  /// ```
  ///
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

  /// Time Of Day Emoji
  ///
  /// Returns emoji of time of day in the format 🌤️, 🌤️, 🌙 or 🌙
  ///
  /// Usage:
  ///
  /// ```dart
  /// DateTime.now().timeOfDayEmoji
  /// ```
  ///
  /// Result:
  ///
  /// ```dart
  /// 🌤️
  /// ```
  ///
  String get timeOfDayEmoji {
    if (hour >= 0 && hour < 12) {
      return '🌤️';
    } else if (hour >= 12 && hour < 16) {
      return '🌤️';
    } else if (hour >= 16 && hour < 20) {
      return '🌙';
    } else {
      return '🌙';
    }
  }

  /// Is Between
  ///
  /// Returns true if the given [DateTime] is between the given start and end [DateTime]
  ///
  /// Usage:
  ///
  /// ```dart
  /// DateTime.now().isBetween(DateTime(2021, 1, 1), DateTime(2021, 12, 31))
  /// ```
  ///
  /// Result:
  ///
  /// ```dart
  /// true
  /// ```
  ///
  bool isBetween(DateTime start, DateTime end) {
    return isAfter(start) && isBefore(end);
  }

  /// Time Format
  ///
  /// Returns time string in the format 08:00pm
  ///
  /// Usage:
  ///
  /// ```dart
  /// DateTime.now().timeFormat
  /// ```
  ///
  /// Result:
  ///
  /// ```dart
  /// 08:00pm
  /// ```
  ///
  String get timeFormat {
    return formatTime(this);
  }

  /// Readable Date Time Format
  ///
  /// Returns date and time string in the format Tuesday 1 January 2022, 08:00pm
  ///
  /// Usage:
  ///
  /// ```dart
  /// DateTime.now().readableDateTimeFormat
  /// ```
  ///
  /// Result:
  ///
  /// ```dart
  /// Tuesday 1 January 2022, 08:00pm
  /// ```
  String get readableDateTimeFormat {
    return '$readableDate, $timeFormat';
  }

  /// Describe
  ///
  /// Returns date string in the format 08:00pm, Yesterday, Monday, 1/1/2022
  ///
  /// Usage:
  ///
  /// ```dart
  /// DateTime.now().describe
  /// ```
  ///
  /// Result:
  ///
  /// ```dart
  /// 08:00pm
  /// ```
  ///
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

  /// Is Same Day For Year
  ///
  /// Returns true if the given [DateTime] is the same day as the other [DateTime]
  ///
  /// Usage:
  ///
  /// ```dart
  /// DateTime.now().isSameDay(DateTime(2021, 1, 1))
  /// ```
  ///
  /// Result:
  ///
  /// ```dart
  /// false
  /// ```
  ///
  bool isSameDayForYear(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// Is Same Day
  ///
  /// Returns true if the given [DateTime] is the same day as the other [DateTime]
  ///
  /// Usage:
  ///
  /// ```dart
  /// DateTime.now().isSameDay(DateTime(2021, 1, 1))
  /// ```
  ///
  /// Result:
  ///
  /// ```dart
  /// false
  /// ```
  ///
  bool isSameDay(DateTime other) {
    return month == other.month && day == other.day;
  }
}
