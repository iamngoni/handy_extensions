//
//  handy_extensions
//  general_test
//
//  Created by Ngonidzashe Mangudya on 15/02/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/handy_extensions.dart';

void main() {
  test('isNull', () {
    expect(null.isNull, true);
    expect(1.isNull, false);
  });

  test('let', () {
    expect(1.let((it) => it + 1), 2);
  });
}
