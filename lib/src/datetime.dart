import 'package:handy_extensions/src/utils/constants.dart';

extension HandyDateTimeExtension on DateTime {
  /// Readable Date
  ///
  /// Returns date string in the format Tuesday 1 January 2022
  String get readableDate => "$getDay $getDate $getMonth $getYear";

  /// Readable DateTime
  ///
  /// Returns date and time string in the format January 12, 2022 08:00:15
  String get readableDateTime =>
      "$getMonth $getDate, $getYear ${hour >= 10 ? hour : "0$hour"}:${minute >= 10 ? minute : "0$minute"}:${second >= 10 ? second : "0$second"}";

  /// Readable Time
  ///
  /// Returns time string in the format 08:00:34
  String get readableTime =>
      "${hour >= 10 ? hour : "0$hour"}:${minute >= 10 ? minute : "0$minute"}:${second >= 10 ? second : "0$second"}";

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
  String get getYear => "$year";

  /// Time Ago
  ///
  /// Returns string of time difference between given DateTime and
  /// [DateTime.now()] in the format 1d, 2h, 4s or Just now
  String get timeAgo {
    final currentTime = DateTime.now();
    final difference = currentTime.difference(this);

    if (difference.inDays < 0) {
      return "${difference.inDays.abs()}d remaining";
    }

    if (difference.inDays >= 1) {
      return "${difference.inDays}d";
    } else if (difference.inHours >= 1) {
      return "${difference.inHours}h";
    } else if (difference.inMinutes >= 1) {
      return "${difference.inMinutes}m";
    } else if (difference.inSeconds >= 1) {
      return "${difference.inSeconds}s";
    } else {
      return "Just now";
    }
  }
}
