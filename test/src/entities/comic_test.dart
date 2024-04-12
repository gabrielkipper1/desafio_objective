import 'dart:convert';

import 'package:desafio_objective/src/entities/comic.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String json = """
  {
    "resourceURI": "http://gateway.marvel.com/v1/public/comics/82967",
    "name": "Marvel Previews (2017)"
  }
  """;

  String errorJson = """
  {
    "test": "detail",
    "error": "error"
  }
  """;

  group("Comic", () {
    test('should create a comic instance from a json input', () {
      Map<String, dynamic> jsonMap = jsonDecode(json);
      Comic comic = Comic.fromJson(jsonMap);
      expect(comic.resourceURI, "http://gateway.marvel.com/v1/public/comics/82967");
      expect(comic.name, "Marvel Previews (2017)");
    });

    test('should thow an error if any required value is missing in the input json', () {
      Map<String, dynamic> jsonMap = jsonDecode(errorJson);
      expect(() => Comic.fromJson(jsonMap), throwsA(isA<TypeError>()));
    });
  });
}
