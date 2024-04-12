import 'dart:convert';

import 'package:desafio_objective/src/entities/generic/marvel_api_request_data.dart';
import 'package:desafio_objective/src/entities/marvel_url.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String jsonEmptyResult = '''{
   "offset": 0,
    "limit": 20,
    "total": 1493,
    "count": 0,
    "results": []        
  }''';

  String jsonResultUrl = '''{
   "offset": 0,
    "limit": 20,
    "total": 1493,
    "count": 1,
    "results": [
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
    ]}''';

  String jsonResultUrlError = '''{
    "error": 0
  }''';

  group("Marvel API Request Data", () {
    test("should create a MarvelAPIRequestData instance for a MarvelUrl list from a json input. the list must be empty", () {
      Map<String, dynamic> jsonMap = jsonDecode(jsonEmptyResult);
      MarvelApiRequestData<MarvelUrl> marvelApiRequestData = MarvelApiRequestData.fromJson(jsonMap, (json) => MarvelUrl.fromJson(json));
      expect(marvelApiRequestData.offset, 0);
      expect(marvelApiRequestData.limit, 20);
      expect(marvelApiRequestData.total, 1493);
      expect(marvelApiRequestData.count, 0);
      expect(marvelApiRequestData.results.length, 0);
    });
  });

  test("should create a MarvelAPIRequestData instance for a MarvelUrl list from a json input. the list length must be 3", () {
    Map<String, dynamic> jsonMap = jsonDecode(jsonResultUrl);
    MarvelApiRequestData<MarvelUrl> marvelApiRequestData = MarvelApiRequestData.fromJson(jsonMap, (json) => MarvelUrl.fromJson(json));
    expect(marvelApiRequestData.offset, 0);
    expect(marvelApiRequestData.limit, 20);
    expect(marvelApiRequestData.total, 1493);
    expect(marvelApiRequestData.count, 1);
    expect(marvelApiRequestData.results.length, 3);
    expect(marvelApiRequestData.results, isA<List<MarvelUrl>>());
  });

  test("should return an error if any required field is missing in the json", () {
    Map<String, dynamic> jsonMap = jsonDecode(jsonResultUrlError);
    expect(() => MarvelApiRequestData.fromJson(jsonMap, (json) => MarvelUrl.fromJson(json)), throwsA(isA<TypeError>()));
  });
}
