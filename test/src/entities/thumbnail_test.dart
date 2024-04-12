import 'dart:convert';
import 'package:desafio_objective/src/entities/thumbnail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String jsonString = """{
    "path": "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73",
    "extension": "jpg"
  }""";

  String errorJson = """{
    "test": "detail",
    "error": "error"
  }""";

  group("Thumbnail", () {
    test('should create a thumbnail from a json input', () {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      Thumbnail thumbnail = Thumbnail.fromJson(jsonMap);
      expect(thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73");
      expect(thumbnail.extension, "jpg");
      expect(thumbnail.fullPath, "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73.jpg");
    });

    test('should thow an error if any required value is missing in the input json', () {
      Map<String, dynamic> jsonMap = jsonDecode(errorJson);
      expect(() => Thumbnail.fromJson(jsonMap), throwsA(isA<TypeError>()));
    });
  });
}
