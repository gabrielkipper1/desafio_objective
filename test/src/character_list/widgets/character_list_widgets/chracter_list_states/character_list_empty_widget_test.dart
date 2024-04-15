import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/chracter_list_states/character_list_empty_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Should Have a empty result message and it must be a text', (tester) async {
    await tester.pumpWidget(const CharacterListEmptyWidget());
    final emptyMessage = find.byKey(const Key("empty_message"));
    expect(emptyMessage, findsOneWidget);
    expect(tester.widget<Text>(emptyMessage), isA<Text>());
  });
}
