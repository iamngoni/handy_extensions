//
//  handy_extensions
//  datetime_test
//
//  Created by Ngonidzashe Mangudya on 15/02/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/handy_extensions.dart';

void main() {
  test('getYear', () {
    expect(DateTime.now().getYear, '${DateTime.now().year}');
  });

  test('getDay', () {
    expect(DateTime(1998, 10, 13).getDay, 'Tuesday');
  });

  test('getShortDay', () {
    expect(DateTime(1998, 10, 13).getShortDay, 'Tue');
  });

  test('getMonth', () {
    expect(DateTime(1998, 10, 13).getMonth, 'October');
  });

  test('getShortMonth', () {
    expect(DateTime(1998, 10, 13).getShortMonth, 'Oct');
  });

  test('getDate', () {
    expect(DateTime.now().getDate, DateTime.now().day);
  });

  test('timeAgo', () {
    expect(DateTime.now().timeAgo, 'Just now');
  });

  test('readableDate', () {
    expect(DateTime(1998, 10, 13).readableDate, 'Tuesday 13 October 1998');
  });

  test('readableDateTime', () {
    expect(
      DateTime(1998, 10, 13, 10, 10, 10).readableDateTime,
      'October 13, 1998 10:10:10',
    );
  });

  test('readableTime', () {
    expect(DateTime(1998, 10, 13, 10, 10, 10).readableTime, '10:10:10');
  });

  test('getDay', () {
    expect(DateTime(1998, 10, 13).getDay, 'Tuesday');
  });

  test('getShortDay', () {
    expect(DateTime(1998, 10, 13).getShortDay, 'Tue');
  });

  test('getDate', () {
    expect(DateTime.now().getDate, DateTime.now().day);
  });

  test('getMonth', () {
    expect(DateTime(1998, 10, 13).getMonth, 'October');
  });

  test('getShortMonth', () {
    expect(DateTime(1998, 10, 13).getShortMonth, 'Oct');
  });

  test('getYear', () {
    expect(DateTime.now().getYear, '${DateTime.now().year}');
  });

  test('timeAgo', () {
    expect(DateTime.now().timeAgo, 'Just now');
  });

  test('timeOfDayStr: Morning', () {
    expect(DateTime(1998, 10, 13, 10, 10, 10).timeOfDayStr, 'Morning');
  });

  test('timeOfDayStr: Afternoon', () {
    expect(DateTime(1998, 10, 13, 14, 10, 10).timeOfDayStr, 'Afternoon');
  });

  test('timeOfDayStr: Evening', () {
    expect(DateTime(1998, 10, 13, 18, 10, 10).timeOfDayStr, 'Evening');
  });

  test('timeOfDayStr: Night', () {
    expect(DateTime(1998, 10, 13, 22, 10, 10).timeOfDayStr, 'Night');
  });

  test('timeOfDayEmoji: Morning', () {
    expect(DateTime(1998, 10, 13, 10, 10, 10).timeOfDayEmoji, '🌤️');
  });

  test('timeOfDayEmoji: Afternoon', () {
    expect(DateTime(1998, 10, 13, 14, 10, 10).timeOfDayEmoji, '🌤️');
  });

  test('timeOfDayEmoji: Evening', () {
    expect(DateTime(1998, 10, 13, 18, 10, 10).timeOfDayEmoji, '🌙');
  });

  test('timeOfDayEmoji: Night', () {
    expect(DateTime(1998, 10, 13, 22, 10, 10).timeOfDayEmoji, '🌙');
  });

  test('isBetween', () {
    expect(
      DateTime.now().isBetween(DateTime(2021), DateTime.now().add(1.years)),
      true,
    );
  });

  test('timeFormat', () {
    expect(
      DateTime(1998, 10, 13, 10, 10, 10).timeFormat,
      '10:10AM',
    );
  });

  test('readableDateTimeFormat', () {
    expect(
      DateTime(1998, 10, 13, 10, 10, 10).readableDateTimeFormat,
      'Tuesday 13 October 1998, 10:10AM',
    );
  });

  test('describe: Current', () {
    expect(DateTime.now().describe, DateTime.now().timeFormat);
  });

  test('describe: Yesterday', () {
    expect(
      DateTime.now().subtract(1.days).describe,
      'Yesterday',
    );
  });

  test('describe: Week', () {
    expect(
      DateTime.now().subtract(7.days).describe,
      DateTime.now().subtract(7.days).getDay,
    );
  });

  test('describe: Month', () {
    final DateTime date = DateTime.now().subtract(30.days);
    expect(
      date.describe,
      '${date.getDate}/${date.getMonth}/${date.getYear}',
    );
  });

  test('isSameDay', () {
    expect(
      DateTime(2021).isSameDay(DateTime(2022)),
      true,
    );
  });

  test('isSameDayForYear', () {
    expect(
      DateTime(2021).isSameDayForYear(DateTime(2022)),
      false,
    );
  });
}
