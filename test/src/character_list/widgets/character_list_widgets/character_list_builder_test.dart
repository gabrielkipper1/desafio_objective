import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:desafio_objective/src/character_list/bloc/character_list_bloc.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/character_list_builder.dart';
import 'package:desafio_objective/src/entities/character.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_request_data.dart';
import 'package:desafio_objective/src/repositories/character_repository/character_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../sample_data/testingSampleData.dart';

class MockRepository extends Mock implements CharacterRepository {}

class CharacterBlocMock extends MockBloc<CharacterListEvent, CharacterListState> implements CharacterListBloc {}

void main() {
  group("Character List Builder", () {
    late CharacterBlocMock bloc = CharacterBlocMock();

    Widget listBuilderWidget() {
      return Material(
        child: BlocProvider<CharacterListBloc>(
          create: (_) => bloc,
          lazy: false,
          child: ResponsiveBreakpoints.builder(breakpoints: [const Breakpoint(start: 10, end: 1000)], child: const CharacterListBuilder()),
        ),
      );
    }

    testWidgets("should have inital message when bloc has initial state", (tester) async {
      whenListen(bloc, Stream.fromIterable([CharacterListInitial()]), initialState: CharacterListInitial());
      await tester.pumpWidget(listBuilderWidget());
      final initialMessage = find.byKey(const Key("list_builder_initial"));
      expect(initialMessage, findsOneWidget);
    });

    testWidgets("Should have a loding widget when bloc state is loading ", (widgetTester) async {
      whenListen(bloc, Stream.fromIterable([const CharacterListLoading()]), initialState: const CharacterListLoading());
      await widgetTester.pumpWidget(listBuilderWidget());

      expect(find.byKey(const Key("list_builder_loading")), findsOneWidget);
    });

    testWidgets("Should have a list view when bloc state is loaded ", (tester) async {
      MarvelApiRequestData<Character> character = MarvelApiRequestData.fromJson(
          (jsonDecode(testingSampleData("/json/characters.json")))["data"], (characterJson) => Character.fromJson(characterJson));
      whenListen(bloc, Stream.fromIterable([CharacterListLoaded(character)]), initialState: CharacterListLoaded(character));

      await mockNetworkImagesFor(() async => await tester.pumpWidget(listBuilderWidget()));
      var listview = find.byKey(const Key("list_builder_loaded"));

      expect(listview, findsOneWidget);
    });

    testWidgets("Should have a error widget when bloc state is error ", (widgetTester) async {
      whenListen(bloc, Stream.fromIterable([const CharacterListError("Error message")]),
          initialState: const CharacterListError("Error message"));
      await widgetTester.pumpWidget(listBuilderWidget());

      expect(find.byKey(const Key("list_builder_error")), findsOneWidget);
    });

    testWidgets("Should have a empty widget when bloc state is empty ", (widgetTester) async {
      whenListen(bloc, Stream.fromIterable([CharacterListEmptyState()]), initialState: CharacterListEmptyState());
      await widgetTester.pumpWidget(listBuilderWidget());

      expect(find.byKey(const Key("list_builder_empty")), findsOneWidget);
    });

    testWidgets("Should have a loading widget when bloc state is page changed ", (widgetTester) async {
      whenListen(bloc, Stream.fromIterable([const CharacterListPageChangedRequested(page: 2)]),
          initialState: const CharacterListPageChangedRequested(page: 2));
      await widgetTester.pumpWidget(listBuilderWidget());

      expect(find.byKey(const Key("list_builder_loading")), findsOneWidget);
    });
  });
}
