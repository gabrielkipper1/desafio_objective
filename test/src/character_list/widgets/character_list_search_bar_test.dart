import 'package:desafio_objective/src/character_list/widgets/character_list_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CharacterListSearchBar', () {
    testWidgets("should have a search bar and it must be o the type 'SEARCHBAR'", (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: CharacterListSearchBar(),
      ));
      final searchBar = find.byKey(const Key("search_bar"));
      final barElement = tester.widget<SearchBar>(searchBar);
      expect(searchBar, findsOneWidget);
      expect(barElement, isNotNull);
    });
  });
}
