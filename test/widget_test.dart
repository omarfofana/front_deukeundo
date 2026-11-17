import 'package:flutter_test/flutter_test.dart';

import 'package:front_deukeundo/main.dart';

void main() {
  testWidgets('L’application affiche l’écran choisi dans main.dart', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const DeukendoApp());

    expect(find.text('Deukendo'), findsOneWidget);
  });
}
