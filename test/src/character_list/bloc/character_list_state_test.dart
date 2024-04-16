import 'package:desafio_objective/src/features/character_list/bloc/character_list_bloc.dart';
import 'package:desafio_objective/src/entities/character.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_request_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Character List State", () {
    test("Should be a subclass of Equatable and props list be empty", () {
      var state = CharacterListInitial();
      expect(state, isA<Equatable>());
      expect(state.props, isEmpty);
    });

    test("Should be a subclass of Equatable and props list be empty", () {
      var state = const CharacterListLoading();
      expect(state, isA<Equatable>());
      expect(state.props, isEmpty);
    });

    test("Should be a subclass of Equatable and props list be empty", () {
      var state = CharacterListLoaded(MarvelApiRequestData<Character>(count: 1, limit: 1, offset: 1, results: [], total: 1));
      expect(state, isA<Equatable>());
      expect(state.props, isEmpty);
    });

    test("Should be a subclass of Equatable and props list be empty", () {
      var state = const CharacterListError("error");
      expect(state, isA<Equatable>());
      expect(state.props, isEmpty);
    });

    test("Should be a subclass of Equatable and props list be empty", () {
      var state = const CharacterListPageChangedRequested(page: 1);
      expect(state, isA<Equatable>());
      expect(state.props, isEmpty);
    });
  });
}
