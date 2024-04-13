import 'dart:convert';

import 'package:desafio_objective/src/entities/serie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String json = """
  {
    "resourceURI": "http://gateway.marvel.com/v1/public/series/354",
    "name": "Avengers (1998 - 2004)"
  }
  """;

  String errorJson = """
  {
    "test": "detail",
    "error": "error"
  }
  """;

  group("Serie", () {
    test('should create a serie from a json input', () {
      Map<String, dynamic> jsonMap = jsonDecode(json);
      Serie serie = Serie.fromJson(jsonMap);
      expect(serie.resourceURI, "http://gateway.marvel.com/v1/public/series/354");
      expect(serie.name, "Avengers (1998 - 2004)");
    });

    test('should thow an error if any required value is missing in the input json', () {
      Map<String, dynamic> jsonMap = jsonDecode(errorJson);
      expect(() => Serie.fromJson(jsonMap), throwsA(isA<TypeError>()));
    });
  });
}
