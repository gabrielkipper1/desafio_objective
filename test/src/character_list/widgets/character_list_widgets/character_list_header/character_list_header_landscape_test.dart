import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/character_list_header/character_list_header_landscape.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Character List Header Landscape", () {
    testWidgets("should have a character name text", (tester) async {
      await tester.pumpWidget(const CharacterListHeaderLandscape());
      final characterName = find.byKey(const Key("list_header_name"));
      expect(characterName, findsOneWidget);
    });

    testWidgets("should have a character serie text", (tester) async {
      await tester.pumpWidget(const CharacterListHeaderLandscape());
      final characterSerie = find.byKey(const Key("list_header_serie"));
      expect(characterSerie, findsOneWidget);
    });

    testWidgets("should have a character event text", (tester) async {
      await tester.pumpWidget(const CharacterListHeaderLandscape());
      final characterEvent = find.byKey(const Key("list_header_event"));
      expect(characterEvent, findsOneWidget);
    });
  });
}
