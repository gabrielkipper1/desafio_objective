import 'dart:convert';

import 'package:desafio_objective/src/features/character_list/widgets/character_list_widgets/character_list_tile/character_list_tile_landscape.dart';
import 'package:desafio_objective/src/entities/character.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_request_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../sample_data/testingSampleData.dart';

void main() {
  late Character character;

  setUp(() {
    Map<String, dynamic> json = jsonDecode(testingSampleData("/json/characters.json"));
    MarvelApiRequestData<Character> request = MarvelApiRequestData<Character>.fromJson(
      json["data"],
      (characterJson) => Character.fromJson(characterJson),
    );
    character = request.results.first;
  });

  group("Character List Tile Landscape", () {
    testWidgets("should have a flex_profile with value of 1", (widgetTester) async {
      await mockNetworkImagesFor(
          () async => await widgetTester.pumpWidget(Material(child: CharacterListTileLandscapeWidget(character: character))));
      final flexProfile = find.byKey(const Key("flex_profile"));
      final flexProfileWidget = widgetTester.widget<Flexible>(flexProfile);
      expect(flexProfile, findsOneWidget);
      expect(flexProfileWidget.flex, 1);
    });

    testWidgets("should have a flex_series with value of 1", (widgetTester) async {
      await mockNetworkImagesFor(
          () async => await widgetTester.pumpWidget(Material(child: CharacterListTileLandscapeWidget(character: character))));
      final flexSeries = find.byKey(const Key("flex_series"));
      final flexSeriesWidget = widgetTester.widget<Flexible>(flexSeries);
      expect(flexSeries, findsOneWidget);
      expect(flexSeriesWidget.flex, 1);
    });

    testWidgets("should have a flex_events with value of 2", (widgetTester) async {
      await mockNetworkImagesFor(
          () async => await widgetTester.pumpWidget(Material(child: CharacterListTileLandscapeWidget(character: character))));
      final flexEvents = find.byKey(const Key("flex_events"));
      final flexEventsWidget = widgetTester.widget<Flexible>(flexEvents);
      expect(flexEvents, findsOneWidget);
      expect(flexEventsWidget.flex, 2);
    });
  });
}
