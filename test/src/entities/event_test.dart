import 'dart:convert';

import 'package:desafio_objective/src/entities/event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String json = """
  {
    "resourceURI": "http://gateway.marvel.com/v1/public/events/116",
    "name": "Acts of Vengeance!"
  }
  """;

  String errorJson = """
  {
    "test": "detail",
    "error": "error"
  }
  """;

  group("Event", () {
    test('should create a event from a json input', () {
      Map<String, dynamic> jsonMap = jsonDecode(json);
      Event event = Event.fromJson(jsonMap);
      expect(event.resourceURI, "http://gateway.marvel.com/v1/public/events/116");
      expect(event.name, "Acts of Vengeance!");
    });

    test('should thow an error if any required value is missing in the input json', () {
      Map<String, dynamic> jsonMap = jsonDecode(errorJson);
      expect(() => Event.fromJson(jsonMap), throwsA(isA<TypeError>()));
    });
  });
}
