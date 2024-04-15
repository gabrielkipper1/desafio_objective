import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/chracter_list_states/character_list_initial_message_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should find welcome text and welcome message key and they must be a text', (tester) async {
    await tester.pumpWidget(const CharacterListInitialMessageWidget());
    final welcomeMessage = find.byKey(const Key("welcome_message"));
    final welcomeInstructions = find.byKey(const Key("welcome_instruction"));
    expect(welcomeMessage, findsOneWidget);
    expect(tester.widget<Text>(welcomeMessage), isA<Text>());
    expect(welcomeInstructions, findsOneWidget);
    expect(tester.widget<Text>(welcomeInstructions), isA<Text>());
  });
}
