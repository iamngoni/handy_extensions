//
//  handy_extensions
//  map_test
//
//  Created by Ngonidzashe Mangudya on 02/03/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/handy_extensions.dart';

void main() {
  test('swap', () {
    final map = {1: 'one', 2: 'two'};
    expect(map.swap, {'one': 1, 'two': 2});
  });

  test('copy', () {
    final map = {1: 'one', 2: 'two'};
    final copy = map.copy;
    expect(copy, map);
  });

  test('removeNulls', () {
    final map = {1: 'one', 2: null};
    final result = map.removeNulls;
    expect(result, {1: 'one'});
  });

  test('adjustOrder', () {
    final map = {1: 'one', 2: 'two', 3: 'three'};
    final result = map.adjustOrder(0, 2);
    expect(result, {2: 'two', 3: 'three', 1: 'one'});
  });

  test('getOrDefault', () {
    final map = {1: 'one', 2: 'two', 4: null};
    expect(map.getOrDefault(1, 'default'), 'one');
    expect(map.getOrDefault(3, 'default'), 'default');
    expect(map.getOrDefault(4, 'default'), 'default');
  });
}
