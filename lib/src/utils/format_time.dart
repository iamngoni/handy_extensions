//
//  format_time
//  handy_extensions
//
//  Created by Ngonidzashe Mangudya on 26/6/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

String formatTime(DateTime dateTime) {
  final hour = dateTime.hour;
  final minute = dateTime.minute;

  final String period = hour >= 12 ? 'PM' : 'AM';
  int hourIn12HourFormat = hour > 12 ? hour - 12 : hour;
  hourIn12HourFormat = hourIn12HourFormat == 0 ? 12 : hourIn12HourFormat;
  final String hourStr = hourIn12HourFormat.toString().padLeft(2, '0');
  final String minuteStr = minute.toString().padLeft(2, '0');

  return '$hourStr:$minuteStr$period';
}
