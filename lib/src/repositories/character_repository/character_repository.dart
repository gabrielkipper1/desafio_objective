import 'package:desafio_objective/src/entities/generic/marvel_api_request_data.dart';

abstract class CharacterRepository {
  Future<MarvelApiRequestData> getCharacters();
  Future<MarvelApiRequestData> searchCharacters({String? search});
}
