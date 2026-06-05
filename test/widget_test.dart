import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_banda_militar/main.dart';

void main() {
  testWidgets(
    'shows military band library navigation',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MilitaryBandApp());

      expect(find.text('Biblioteca de Banda Militar'), findsOneWidget);
      expect(find.text('Partituras'), findsOneWidget);
      expect(find.text('Calendario Patriótico'), findsOneWidget);
      expect(find.text('Reglamentos'), findsOneWidget);
    },
  );

  testWidgets(
    'navigates to sheet music screen',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MilitaryBandApp());

      await tester.tap(find.byKey(const ValueKey('sheetMusicButton')));
      await tester.pumpAndSettle();

      expect(find.text('Partituras'), findsWidgets);
      expect(find.text('Himno Nacional - Versión para banda'), findsOneWidget);
    },
  );

  testWidgets(
    'navigates to patriotic calendar screen',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MilitaryBandApp());

      await tester.tap(find.byKey(const ValueKey('calendarButton')));
      await tester.pumpAndSettle();

      expect(find.text('Calendario Patriótico'), findsWidgets);
      expect(find.text('18 de septiembre'), findsOneWidget);
    },
  );

  testWidgets(
    'navigates to regulations screen',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MilitaryBandApp());

      await tester.tap(find.byKey(const ValueKey('regulationsButton')));
      await tester.pumpAndSettle();

      expect(find.text('Reglamentos'), findsWidgets);
      expect(
        find.text('Presentación personal y uniforme para ceremonias'),
        findsOneWidget,
      );
    },
  );
}
