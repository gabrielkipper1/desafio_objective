import 'package:desafio_objective/src/character_list/pages/character_list_page.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_paginator.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_search_bar.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/character_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Character List Page", () {
    testWidgets("Should have a search bar in the character list page and it must be of type CharacterListSearchBar", (tester) async {
      await tester.pumpWidget(const MaterialApp(home: CharacterListPage()));
      var searchBarWidget = find.byType(CharacterListSearchBar);
      expect(searchBarWidget, findsOneWidget);
    });

    testWidgets("Should have a character list builder in the character list page and it must be of type CharacterListBuilder",
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: CharacterListPage()));
      var characterListWidget = find.byType(CharacterListBuilder);
      expect(characterListWidget, findsOneWidget);
    });

    testWidgets("Should have a list paginator in the character list page and it must be of type CharacterListPaginator", (tester) async {
      await tester.pumpWidget(const MaterialApp(home: CharacterListPage()));
      var characterListWidget = find.byType(CharacterListPaginator);
      expect(characterListWidget, findsOneWidget);
    });
  });
}
