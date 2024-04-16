import 'dart:convert';

import 'package:desafio_objective/src/features/character_list/use_cases/search_characters_use_case.dart';
import 'package:desafio_objective/src/entities/character.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_request_data.dart';
import 'package:desafio_objective/src/repositories/character_repository/character_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../sample_data/testingSampleData.dart';

class MockRepository extends CharacterRepository {
  @override
  Future<MarvelApiRequestData<Character>> searchCharacters({String? search, int? offset, int? limit}) {
    Map<String, dynamic> json = jsonDecode(testingSampleData("/json/characters.json"));
    return Future.value(MarvelApiRequestData<Character>.fromJson(json["data"], (json) => Character.fromJson(json)));
  }
}

void main() {
  late CharacterRepository repository = MockRepository();

  group("Character Repository", () {
    test("Should return a list of characters", () async {
      final useCase = SearchCharactersUseCase(repository);
      final result = await useCase.searchCharacters(query: "Spider", offset: 0, limit: 4);
      expect(result, isA<MarvelApiRequestData>());
    });
  });
}
