import 'dart:convert';

import 'package:desafio_objective/src/entities/comic.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_collection_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String jsonEmptyList = """{
      "available": 0,
      "returned": 0,
      "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
      "items": []
    }""";

  String jsonWithListItem = """{
      "available": 1,
      "returned": 1,
      "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
      "items": [
        {
          "resourceURI": "http://gateway.marvel.com/v1/public/comics/43506",
          "name": "Age of Ultron (2013) #3"
        }
      ]
    }""";

  String errorJson = """{
      "test": "detail",
      "error": "error"
    }""";

  group("Marvel API Collection Data", () {
    test("should create a MavelAPICollectionData instance for a Comic list from a json input. the list must be empty", () {
      Map<String, dynamic> jsonMap = jsonDecode(jsonEmptyList);
      MarvelAPICollectionData<Comic> marvelAPICollectionData = MarvelAPICollectionData.fromJson(jsonMap, (json) => Comic.fromJson(json));
      expect(marvelAPICollectionData.available, 0);
      expect(marvelAPICollectionData.returned, 0);
      expect(marvelAPICollectionData.collectionURI, "http://gateway.marvel.com/v1/public/characters/1011334/comics");
      expect(marvelAPICollectionData.items.length, 0);
    });

    test('should create a MarvelAPICollectionData instance for a Comic list from a json input. the list must have one element', () {
      Map<String, dynamic> jsonMap = jsonDecode(jsonWithListItem);
      MarvelAPICollectionData<Comic> marvelAPICollectionData = MarvelAPICollectionData.fromJson(jsonMap, (json) => Comic.fromJson(json));
      expect(marvelAPICollectionData.available, 1);
      expect(marvelAPICollectionData.returned, 1);
      expect(marvelAPICollectionData.collectionURI, "http://gateway.marvel.com/v1/public/characters/1011334/comics");
      expect(marvelAPICollectionData.items.length, 1);
    });

    test('should throw an error if any required field is missing in the json', () {
      Map<String, dynamic> jsonMap = jsonDecode(errorJson);
      expect(() => MarvelAPICollectionData.fromJson(jsonMap, (json) => Comic.fromJson(json)), throwsA(isA<TypeError>()));
    });
  });
}
