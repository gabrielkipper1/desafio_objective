import 'package:desafio_objective/src/app_module.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/character_list_tile/character_list_tile_builder.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/chracter_list_states/character_list_empty_widget.dart';
import 'package:desafio_objective/src/material_app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_paginator/number_paginator.dart';

void main() {
  group("Integration test - search", () {
    testWidgets("Should be able to search for spider man", (tester) async {
      await tester.pumpWidget(ModularApp(module: AppModule(), child: const MaterialAppWidget()));
      await tester.pumpAndSettle();

      final searchBar = find.byType(TextFormField);
      expect(searchBar, findsOneWidget);

      await tester.enterText(searchBar, "Spider");
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(tester.widget<TextFormField>(searchBar).controller, isNotNull);
      expect(tester.widget<TextFormField>(searchBar).controller!.text, "Spider");

      //wait for http
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final characterList = find.byKey(const Key("character_list"));
      expect(characterList, findsOneWidget);

      final list = tester.widget<Column>(characterList);
      // list header + 4 characters in the list = 5 children
      expect(list.children.length, 5);
    });

    testWidgets("should get empty list when searching for a character the does not exist", (tester) async {
      await tester.pumpWidget(ModularApp(module: AppModule(), child: const MaterialAppWidget()));
      await tester.pumpAndSettle();

      final searchBar = find.byType(TextFormField);
      expect(searchBar, findsOneWidget);

      await tester.enterText(searchBar, "character that does not exist");
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(tester.widget<TextFormField>(searchBar).controller, isNotNull);
      expect(tester.widget<TextFormField>(searchBar).controller!.text, "character that does not exist");

      //wait for http
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final emptyListWidget = find.byType(CharacterListEmptyWidget);
      expect(emptyListWidget, findsOneWidget);
    });

    testWidgets("should search for spider man, then go to the next page and get different results", (tester) async {
      await tester.pumpWidget(ModularApp(module: AppModule(), child: const MaterialAppWidget()));
      await tester.pumpAndSettle();

      final searchBar = find.byType(TextFormField);
      expect(searchBar, findsOneWidget);

      await tester.enterText(searchBar, "Spider");
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(tester.widget<TextFormField>(searchBar).controller, isNotNull);
      expect(tester.widget<TextFormField>(searchBar).controller!.text, "Spider");

      //wait for http
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final characterList = find.byKey(const Key("character_list"));
      expect(characterList, findsOneWidget);

      final list = tester.widget<Column>(characterList);
      // list header + 4 characters in the list = 5 children
      expect(list.children.length, 5);

      final characterListTile = find.byType(CharacterListTileBuilder);
      expect(characterListTile, findsNWidgets(4));

      final paginator = find.byType(NumberPaginator);
      expect(paginator, findsOneWidget);

      final paginatorWidget = tester.widget<NumberPaginator>(paginator);
      paginatorWidget.controller!.currentPage = 1;
      paginatorWidget.onPageChange!(1);
      await tester.pumpAndSettle();

      //wait for http
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final characterListTile2 = find.byType(CharacterListTileBuilder);
      expect(characterListTile2, findsNWidgets(4));
      expect(characterListTile, isNot(characterListTile2));
    });
  });
}
