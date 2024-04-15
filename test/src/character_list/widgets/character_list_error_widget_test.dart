import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/chracter_list_states/character_list_error_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Character List Error Widget", () {
    testWidgets("should have a error message with the correct value", (tester) async {
      await tester.pumpWidget(const CharacterListErrorWidget(errorMessage: "Error message"));
      final errorMessage = find.byKey(const Key("error_message"));
      final textWidget = tester.widget<Text>(errorMessage);
      expect(errorMessage, findsOneWidget);
      expect(textWidget.data, "Error message");
    });
  });
}
