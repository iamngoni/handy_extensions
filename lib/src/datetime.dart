import 'package:handy_extensions/src/utils/constants.dart';

extension HandyDateTimeExtension on DateTime {
  String get readableDate => "$getDay $getDate $getMonth $getYear";

  String get readableDateTime =>
      "$getMonth $getDate, $getYear ${hour >= 10 ? hour : "0$hour"}:${minute >= 10 ? minute : "0$minute"}:${second >= 10 ? second : "0$second"}";

  String get readableTime =>
      "${hour >= 10 ? hour : "0$hour"}:${minute >= 10 ? minute : "0$minute"}:${second >= 10 ? second : "0$second"}";

  String get getDay => weekday == 7
      ? DateConstants.days[0].day
      : DateConstants.days[weekday].day;

  int get getDate => day;

  String get getMonth => DateConstants.months[month - 1].month;

  String get getYear => "$year";

  String get timeAgo {
    final currentTime = DateTime.now();
    final difference = currentTime.difference(this);

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
