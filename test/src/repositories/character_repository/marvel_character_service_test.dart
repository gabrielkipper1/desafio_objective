import 'dart:convert';

import 'package:desafio_objective/src/entities/generic/marvel_api_request_data.dart';
import 'package:desafio_objective/src/repositories/character_repository/marvel_character_service.dart';
import 'package:desafio_objective/src/repositories/http_client/dio_http.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../sample_data/testingSampleData.dart';

void main() {
  late MarvelCharacterService marvelCharacterService;
  late DioHttp dio;
  late DioAdapter adapter;

  setUp(() {
    dio = DioHttp();
    adapter = DioAdapter(dio: dio.client);
    marvelCharacterService = MarvelCharacterService(
      httpClient: dio,
    );
  });

  group("Marvel Character Service", () {
    test("create an instance with DioHttp", () {
      final service = MarvelCharacterService(
        httpClient: dio,
      );

      expect(service, isA<MarvelCharacterService>());
    });

    test("Should return a MarvelApiRequestData", () async {
      adapter.onGet("https://gateway.marvel.com/v1/public/characters", (server) {
        final json = testingSampleData("json/characters.json");
        server.reply(200, jsonDecode(json));
      });

      final result = await marvelCharacterService.getCharacters();
      expect(result, isA<MarvelApiRequestData>());
    });

    test("Should return a MarvelApiRequestData with search", () async {
      adapter.onGet("https://gateway.marvel.com/v1/public/characters", (server) {
        final json = testingSampleData("json/character_search.json");
        server.reply(200, jsonDecode(json));
      });

      final result = await marvelCharacterService.searchCharacters(search: "search_term");
      expect(result, isA<MarvelApiRequestData>());
      expect(result.results.length, 1);
    });

    test("Should not add 'startWith' parameter if search is empty", () async {
      adapter.onGet("https://gateway.marvel.com/v1/public/characters", (server) {
        final json = testingSampleData("json/characters.json");
        server.reply(200, jsonDecode(json));
      });

      final result = await marvelCharacterService.searchCharacters(search: "");
      expect(result, isA<MarvelApiRequestData>());
    });
  });
}
