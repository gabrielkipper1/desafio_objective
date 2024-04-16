import 'package:desafio_objective/src/entities/character.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_request_data.dart';
import 'package:desafio_objective/src/repositories/character_repository/character_repository.dart';

class SearchCharactersUseCase {
  final CharacterRepository _characterRepository;
  SearchCharactersUseCase(this._characterRepository);

  String search = "";
  int page = 0;

  Future<MarvelApiRequestData<Character>> searchCharacters({String? query, required int offset, required int limit}) async {
    search = query ?? "";
    page = (offset / limit).floor();

    try {
      return await _characterRepository.searchCharacters(search: query, offset: offset, limit: limit);
    } catch (e) {
      rethrow;
    }
  }

  Future<MarvelApiRequestData<Character>> changePage({required int page, required int limit}) async {
    try {
      return await _characterRepository.searchCharacters(search: search, offset: page * limit, limit: limit);
    } catch (e) {
      rethrow;
    }
  }
}
