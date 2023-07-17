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
    expect(DateTime(1998, 10, 13, 10, 10, 10).readableDateTime,
        'October 13, 1998 10:10:10');
  });

  test('readableTime', () {
    expect(DateTime(1998, 10, 13, 10, 10, 10).readableTime, '10:10:10');
  });
}
