import 'dart:convert';

import 'package:desafio_objective/src/entities/marvel_url.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String jsonString = """{
    "type": "detail",
    "url": "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=f42eb7281e3be0a38aa98e95e9fc08d3"
  }""";

  String errorJson = """{
    "test": "detail",
    "error": "error"
  }""";

  group("Marvel Url", () {
    test('should create a marvel url from a json input', () {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      MarvelUrl marvelUrl = MarvelUrl.fromJson(jsonMap);
      expect(marvelUrl.type, "detail");
      expect(marvelUrl.url, "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=f42eb7281e3be0a38aa98e95e9fc08d3");
    });
  });

  test('should thow an error if any required value is missing in the input json', () {
    Map<String, dynamic> jsonMap = jsonDecode(errorJson);
    expect(() => MarvelUrl.fromJson(jsonMap), throwsA(isA<TypeError>()));
  });
}
