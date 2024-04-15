import 'package:desafio_objective/src/entities/character.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_request_data.dart';

abstract class CharacterRepository {
  Future<MarvelApiRequestData<Character>> searchCharacters({String? search, int? offset, int? limit});
}
