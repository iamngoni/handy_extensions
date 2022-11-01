import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/handy_extensions.dart';

void main() {
  test("isNull", () {
    expect(null.isNull, true);
    expect(1.isNull, false);
  });

  test("let", () {
    expect(1.let((it) => it + 1), 2);
  });
}
