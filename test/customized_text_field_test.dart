import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("TextField test", (WidgetTester tester) async {
    var textField = find.byType(TextField);
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'Enayat');
    expect(find.text('Enayat'), findsOneWidget);
  });
}
