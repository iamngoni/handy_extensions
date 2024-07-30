//
//  handy_extensions
//  iterable_test
//
//  Created by Ngonidzashe Mangudya on 16/02/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/src/iterable.dart';

void main() {
  test('intersperse', () {
    expect(
      [1, 2, 3, 4, 5, 6].intersperse(0),
      [1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6],
    );
  });

  test('intersperseWith', () {
    expect(
      [1, 2, 3, 4, 5, 6].intersperseWith((n) => n.isEven ? 0 : null),
      [1, 0, 2, 3, 0, 4, 5, 0, 6],
    );
  });

  test('intersperseAt', () {
    expect(
      [1, 2, 3, 4, 5, 6].intersperseAt(2, 0),
      [1, 2, 0, 3, 4, 5, 6],
    );
  });
}
