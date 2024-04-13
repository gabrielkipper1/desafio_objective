import 'dart:convert';

import 'package:desafio_objective/src/entities/character.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String characterJson = """
{
    "id": 1011334,
    "name": "3-D Man",
    "description": "test",
    "modified": "2014-04-29T14:18:17-0400",
    "thumbnail": {
        "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
        "extension": "jpg"
    },
    "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011334",
    "comics": {
        "available": 1,
        "returned": 1,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
        "items": [
            {
                "resourceURI": "http://gateway.marvel.com/v1/public/comics/21366",
                "name": "Avengers: The Initiative (2007) #14"
            }
        ]
    },
    "series": {
        "available": 3,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/series",
        "items": [
            {
                "resourceURI": "http://gateway.marvel.com/v1/public/series/1945",
                "name": "Avengers: The Initiative (2007 - 2010)"
            },
            {
                "resourceURI": "http://gateway.marvel.com/v1/public/series/2005",
                "name": "Deadpool (1997 - 2002)"
            },
            {
                "resourceURI": "http://gateway.marvel.com/v1/public/series/2045",
                "name": "Marvel Premiere (1972 - 1981)"
            }
        ],
        "returned": 3
    },
    "stories": {
        "available": 21,
        "returned": 2,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/stories",
        "items": [
            {
                "resourceURI": "http://gateway.marvel.com/v1/public/stories/19947",
                "name": "Cover #19947",
                "type": "cover"
            },
            {
                "resourceURI": "http://gateway.marvel.com/v1/public/stories/19948",
                "name": "The 3-D Man!",
                "type": "interiorStory"
            }
        ]
    },
    "events": {
        "available": 1,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/events",
        "items": [
            {
                "resourceURI": "http://gateway.marvel.com/v1/public/events/269",
                "name": "Secret Invasion"
            }
        ],
        "returned": 1
    },
    "urls": [
        {
            "type": "detail",
            "url": "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=f42eb7281e3be0a38aa98e95e9fc08d3"
        },
        {
            "type": "wiki",
            "url": "http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=f42eb7281e3be0a38aa98e95e9fc08d3"
        },
        {
            "type": "comiclink",
            "url": "http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=f42eb7281e3be0a38aa98e95e9fc08d3"
        }
    ]
}
""";

  String jsonError = '''
  {
    "test": "detail",
    "error": "error"
  }
  ''';

  group('Character', () {
    test('should create a character from a json input', () {
      Map<String, dynamic> jsonMap = jsonDecode(characterJson);
      Character character = Character.fromJson(jsonMap);
      expect(character.id, 1011334);
      expect(character.description, "test");
      expect(character.modified, "2014-04-29T14:18:17-0400");
      expect(character.thumbnail.path, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784");
      expect(character.thumbnail.extension, "jpg");
      expect(character.resourceURI, "http://gateway.marvel.com/v1/public/characters/1011334");

      expect(character.comics.available, 1);
      expect(character.comics.returned, 1);
      expect(character.comics.collectionURI, "http://gateway.marvel.com/v1/public/characters/1011334/comics");
      expect(character.comics.items.length, 1);

      expect(character.series.available, 3);
      expect(character.series.collectionURI, "http://gateway.marvel.com/v1/public/characters/1011334/series");
      expect(character.series.items.length, 3);
      expect(character.series.returned, 3);

      expect(character.stories.available, 21);
      expect(character.stories.returned, 2);
      expect(character.stories.collectionURI, "http://gateway.marvel.com/v1/public/characters/1011334/stories");
      expect(character.stories.items.length, 2);

      expect(character.events.available, 1);
      expect(character.events.collectionURI, "http://gateway.marvel.com/v1/public/characters/1011334/events");
      expect(character.events.items.length, 1);
      expect(character.events.returned, 1);

      expect(character.urls.length, 3);
    });

    test('should throw an error if any required value is missing in the input json', () {
      Map<String, dynamic> jsonMap = jsonDecode(jsonError);
      expect(() => Character.fromJson(jsonMap), throwsA(isA<TypeError>()));
    });
  });
}
