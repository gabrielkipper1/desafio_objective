import 'package:desafio_objective/src/app_module.dart';
import 'package:desafio_objective/src/features/character_list/pages/character_list_page.dart';
import 'package:desafio_objective/src/features/character_list/widgets/character_list_paginator.dart';
import 'package:desafio_objective/src/features/character_list/widgets/character_list_search_bar.dart';
import 'package:desafio_objective/src/features/character_list/widgets/character_list_widgets/character_list_builder.dart';
import 'package:desafio_objective/src/repositories/character_repository/character_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CharacterRepositoryMock extends Mock implements CharacterRepository {}

void main() {
  group("Character List Page", () {
    setUp(() {
      Modular.bindModule(AppModule());
      Modular.replaceInstance<CharacterRepository>(CharacterRepositoryMock());
    });

    Widget getWidget() {
      return ResponsiveBreakpoints.builder(breakpoints: [
        const Breakpoint(start: 0, end: 600, name: MOBILE),
        const Breakpoint(start: 600, end: 5000, name: DESKTOP),
      ], child: const MaterialApp(home: CharacterListPage()));
    }

    testWidgets("Should have a search bar in the character list page and it must be of type CharacterListSearchBar", (tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(getWidget());
      var searchBarWidget = find.byType(CharacterListSearchBar);
      expect(searchBarWidget, findsOneWidget);
    });

    testWidgets("Should have a character list builder in the character list page and it must be of type CharacterListBuilder",
        (tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(getWidget());
      var characterListWidget = find.byType(CharacterListBuilder);
      expect(characterListWidget, findsOneWidget);
    });

    testWidgets("Should have a list paginator in the character list page and it must be of type CharacterListPaginator", (tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(getWidget());
      var characterListWidget = find.byType(CharacterListPaginator);
      expect(characterListWidget, findsOneWidget);
    });
  });
}
