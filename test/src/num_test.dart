//
//  handy_extensions
//  num_test
//
//  Created by Ngonidzashe Mangudya on 15/02/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/handy_extensions.dart';

void main() {
  test('microseconds', () {
    expect(30.microseconds, const Duration(microseconds: 30));
  });

  test('milliseconds', () {
    expect(30.milliseconds, const Duration(milliseconds: 30));
  });

  test('seconds', () {
    expect(30.seconds, const Duration(seconds: 30));
  });

  test('minutes', () {
    expect(30.minutes, const Duration(minutes: 30));
  });

  test('hours', () {
    expect(30.hours, const Duration(hours: 30));
  });

  test('days', () {
    expect(30.days, const Duration(days: 30));
  });

  test('weeks', () {
    expect(30.weeks, const Duration(days: 210));
  });

  test('months', () {
    expect(30.months, const Duration(days: 900));
  });

  test('years', () {
    expect(30.years, const Duration(days: 10950));
  });

  test('all at work', () {
    expect(
      30.weeks + 2.days + 4.hours + 50.minutes,
      const Duration(days: 212, hours: 4, minutes: 50),
    );
  });
}
