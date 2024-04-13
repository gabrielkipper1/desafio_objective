import 'package:desafio_objective/src/entities/character.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_request_data.dart';
import 'package:desafio_objective/src/interceptors/dio/marvel_auth_interceptor_dio.dart';
import 'package:desafio_objective/src/repositories/http_client/http_repository.dart';

class MarvelCharacterService {
  final String baseUrl = "https://gateway.marvel.com/v1/public/characters";
  late final HttpRepository _client;

  MarvelCharacterService({required HttpRepository httpClient}) {
    _client = httpClient;
    _client.registerInterceptor(MarvelAuthInterceptorDio());
  }

  Future<MarvelApiRequestData> getCharacters() async {
    try {
      final result = await _client.get(baseUrl);
      return MarvelApiRequestData.fromJson(result.data["data"], Character.fromJson);
    } catch (e) {
      rethrow;
    }
  }

  Future<MarvelApiRequestData> searchCharacters({String? search}) async {
    try {
      final result = await _client.get(baseUrl, queryParameters: {'nameStartsWith': search});
      return MarvelApiRequestData.fromJson(result.data['data'], Character.fromJson);
    } catch (e) {
      rethrow;
    }
  }
}
