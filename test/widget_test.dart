import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'package:front_deukeundo/main.dart';

void main() {
  // Volontairement indépendant de l'écran choisi dans main.dart : il vérifie
  // seulement que l'application démarre et se met en page sans erreur.
  testWidgets('L’application démarre sans erreur', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const DeukendoApp());
    await tester.pumpAndSettle();

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
