import 'package:desafio_objective/src/features/character_list/widgets/character_list_widgets/character_list_header/character_list_header_portrait.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Character List HEader Portrait", () {
    testWidgets("should have a character name text", (tester) async {
      await tester.pumpWidget(const CharacterListHeaderPortrait());
      final characterName = find.byKey(const Key("list_header_name"));
      expect(characterName, findsOneWidget);
    });
  });
}
