import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/src/utils/constants.dart';

void main() {
  test('constants', () {
    expect(DateConstants.days.length, 7);
    expect(DateConstants.months.length, 12);
  });
}
