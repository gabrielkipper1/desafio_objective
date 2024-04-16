import 'package:desafio_objective/src/character_list/bloc/character_list_bloc.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class CharacterListBlocMock extends Mock implements CharacterListBloc {}

void main() {
  group('CharacterListSearchBar', () {
    testWidgets("should have a search bar and it must be o the type 'TextFormField'", (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Material(child: CharacterListSearchBar()),
      ));
      final searchBar = find.byKey(const Key("search_bar"));
      final barElement = tester.widget<TextFormField>(searchBar);
      expect(searchBar, findsOneWidget);
      expect(barElement, isNotNull);
    });
  });
}
