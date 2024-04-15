import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:desafio_objective/src/character_list/bloc/character_list_bloc.dart';
import 'package:desafio_objective/src/entities/character.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_request_data.dart';
import 'package:desafio_objective/src/repositories/character_repository/character_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../sample_data/testingSampleData.dart';

//mock repository:
// - if limit is 0, it will throw an exception
// - if limit is different from 0, it will return a list of characters from a sample json
class RepositoryMock extends Mock implements CharacterRepository {
  @override
  Future<MarvelApiRequestData<Character>> searchCharacters({String? search, int? offset, int? limit}) async {
    if (limit == 0) throw Exception("Error");

    Map<String, dynamic> json = jsonDecode(testingSampleData("/json/characters.json"));
    await Future.delayed(const Duration(milliseconds: 50));
    return MarvelApiRequestData<Character>.fromJson(json["data"], (json) => Character.fromJson(json));
  }
}

class EmptyListRepositoryMock extends Mock implements CharacterRepository {
  @override
  Future<MarvelApiRequestData<Character>> searchCharacters({String? search, int? offset, int? limit}) async {
    Map<String, dynamic> json = jsonDecode(testingSampleData("/json/empty_list.json"));
    await Future.delayed(const Duration(milliseconds: 50));
    return MarvelApiRequestData<Character>.fromJson(json["data"], (json) => Character.fromJson(json));
  }
}

void main() {
  late CharacterListBloc characterListBloc;

  group("Character List Bloc", () {
    setUp(() async {
      characterListBloc = CharacterListBloc(characterRepository: RepositoryMock());
    });

    blocTest("check if initial state is the expected",
        build: () => characterListBloc, verify: (bloc) => expect(bloc.state, isA<CharacterListInitial>()));

    blocTest(
      "Should emit CharacterListLoading when SearchCharacterEvent is called",
      build: () => characterListBloc,
      act: (bloc) => bloc.add(const SearchCharactersEvent(query: "Spider", offset: 0, limit: 4)),
      wait: const Duration(milliseconds: 1),
      verify: (bloc) => expect(bloc.state, isA<CharacterListLoading>()),
    );

    blocTest(
      "Should emit CharacterListLoaded when SearchCharacterEvent is finished",
      build: () => characterListBloc,
      act: (bloc) => bloc.add(const SearchCharactersEvent(query: "Spider", offset: 0, limit: 4)),
      wait: const Duration(milliseconds: 55),
      verify: (bloc) => expect(bloc.state, isA<CharacterListLoaded>()),
    );

    blocTest(
      "Should emit CharacterListError when SearchCharacterEvent is finished with error",
      build: () => characterListBloc,
      act: (bloc) => bloc.add(const SearchCharactersEvent(query: "Spider", offset: 0, limit: 0)),
      wait: const Duration(milliseconds: 55),
      verify: (bloc) => expect(bloc.state, isA<CharacterListError>()),
    );

    blocTest(
      "Should emit CharacterListPageChangedRequested when ChangePageEvent is called",
      build: () => characterListBloc,
      act: (bloc) => bloc.add(const ChangePageEvent(page: 1, limit: 4)),
      wait: const Duration(milliseconds: 1),
      verify: (bloc) => expect(bloc.state, isA<CharacterListPageChangedRequested>()),
    );

    blocTest(
      "Should emit CharacterListLoaded when ChangePageEvent is finished",
      build: () => characterListBloc,
      act: (bloc) => bloc.add(const ChangePageEvent(page: 1, limit: 4)),
      wait: const Duration(milliseconds: 55),
      verify: (bloc) => expect(bloc.state, isA<CharacterListLoaded>()),
    );

    blocTest(
      "Should emit CharacterListError when ChangePageEvent is finished with error",
      build: () => characterListBloc,
      act: (bloc) => bloc.add(const ChangePageEvent(page: 1, limit: 0)),
      wait: const Duration(milliseconds: 55),
      verify: (bloc) => expect(bloc.state, isA<CharacterListError>()),
    );

    group("Character List Bloc with empty list as return", () {
      setUp(() {
        characterListBloc = CharacterListBloc(characterRepository: EmptyListRepositoryMock());
      });

      blocTest(
        "Should emit CharacterListEmptyState when there are no results",
        build: () => characterListBloc,
        act: (bloc) => bloc.add(const SearchCharactersEvent(query: "Spider", offset: 0, limit: 4)),
        wait: const Duration(milliseconds: 55),
        verify: (bloc) => expect(bloc.state, isA<CharacterListEmptyState>()),
      );
    });
  });
}
