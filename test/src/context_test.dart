//
//  handy_extensions
//  context_test
//
//  Created by Ngonidzashe Mangudya on 15/02/2024.
//  Copyright (c) 2024 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:handy_extensions/handy_extensions.dart';

void main() {
  testWidgets('height returns the height of the device screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            expect(context.height, MediaQuery.of(context).size.height);
            return Container();
          },
        ),
      ),
    );
  });

  testWidgets('width returns the width of the device screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            expect(context.width, MediaQuery.of(context).size.width);
            return Container();
          },
        ),
      ),
    );
  });
}
