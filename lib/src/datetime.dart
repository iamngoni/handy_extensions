import 'package:handy_extensions/src/utils/constants.dart';

extension HandyDateTimeExtension on DateTime {
  String get readableDate => "$getDay $getDate $getMonth $getYear";

  String get readableDateTime =>
      "$getMonth $getDate, $getYear $hour$minute hrs";

  String get readableTime =>
      "${hour >= 10 ? hour : "0$hour"}:${minute >= 10 ? minute : "0$minute"} hrs";

  String get getDay => weekday == 7
      ? DateConstants.days[0].day
      : DateConstants.days[weekday].day;

  int get getDate => day;

  String get getMonth => DateConstants.months[month - 1].month;

  String get getYear => "$year";
}
