import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calc_combustivel/main.dart';

void main() {
  testWidgets('calcula consumo e custo da viagem', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculadoraCombustivelApp());

    await tester.enterText(find.byType(TextFormField).at(0), '100');
    await tester.enterText(find.byType(TextFormField).at(1), '8');
    await tester.enterText(find.byType(TextFormField).at(2), '6');

    await tester.tap(find.text('Calcular'));
    await tester.pumpAndSettle();

    expect(find.textContaining('12.50 km/L'), findsOneWidget);
    expect(find.textContaining('8.00 L/100 km'), findsOneWidget);
    expect(find.textContaining('R\$ 0.48'), findsOneWidget);
    expect(find.textContaining('R\$ 48.00'), findsOneWidget);
  });
}
