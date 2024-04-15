import 'package:desafio_objective/src/entities/character.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_request_data.dart';
import 'package:desafio_objective/src/interceptors/dio/marvel_auth_interceptor_dio.dart';
import 'package:desafio_objective/src/repositories/character_repository/character_repository.dart';
import 'package:desafio_objective/src/repositories/http_client/http_repository.dart';

class MarvelCharacterService implements CharacterRepository {
  final String baseUrl = "https://gateway.marvel.com/v1/public/characters";
  late final HttpRepository _client;

  MarvelCharacterService({required HttpRepository httpClient}) {
    _client = httpClient;
    _client.registerInterceptor(MarvelAuthInterceptorDio());
  }

  @override
  Future<MarvelApiRequestData<Character>> searchCharacters({String? search, int? offset, int? limit}) async {
    try {
      Map<String, dynamic> queryParameters = {};

      if (search != null && search.isNotEmpty) queryParameters['nameStartsWith'] = search;
      queryParameters['offset'] = offset ?? 0;
      queryParameters['limit'] = limit ?? 4;

      final result = await _client.get(baseUrl, queryParameters: queryParameters);
      return MarvelApiRequestData.fromJson(result.data['data'], Character.fromJson);
    } catch (e) {
      rethrow;
    }
  }
}
