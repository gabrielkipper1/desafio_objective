import 'dart:convert';

import 'package:desafio_objective/src/entities/story.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String json = """
  {
    "resourceURI": "http://gateway.marvel.com/v1/public/stories/82967",
    "name": "Marvel Previews (2017)",
    "type": "cover"
  }
  """;

  String errorJson = """
  {
    "test": "detail",
    "error": "error"
  }
  """;

  group("Story", () {
    test('should create a story from a json input', () {
      Map<String, dynamic> jsonMap = jsonDecode(json);
      Story story = Story.fromJson(jsonMap);
      expect(story.resourceURI, "http://gateway.marvel.com/v1/public/stories/82967");
      expect(story.name, "Marvel Previews (2017)");
      expect(story.type, "cover");
    });

    test('should thow an error if any required value is missing in the input json', () {
      Map<String, dynamic> jsonMap = jsonDecode(errorJson);
      expect(() => Story.fromJson(jsonMap), throwsA(isA<TypeError>()));
    });
  });
}
