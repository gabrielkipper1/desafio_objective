import 'dart:convert';
import 'package:desafio_objective/src/character_detail/pages/character_detail_page.dart';
import 'package:desafio_objective/src/character_detail/widgets/character_profile_detailed.dart';
import 'package:desafio_objective/src/entities/character.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_request_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../sample_data/testingSampleData.dart';

void main() {
  group("Character Detail Page", () {
    late Character character;

    setUp(() {
      Map<String, dynamic> json = jsonDecode(testingSampleData("/json/characters.json"));
      character = MarvelApiRequestData.fromJson(json["data"], (character) => Character.fromJson(character)).results.first;
    });

    testWidgets("Should render character details widget", (tester) async {
      await mockNetworkImagesFor(() async => await tester.pumpWidget(MaterialApp(home: CharacterDetailPage(character: character))));
      expect(find.byType(CharacterProfileDetailed), findsOneWidget);
    });

    testWidgets("Should renderer serie list tile", (widgetTester) async {
      await mockNetworkImagesFor(() async => await widgetTester.pumpWidget(MaterialApp(home: CharacterDetailPage(character: character))));
      final widget = find.byKey(const Key("series_tile"));
      expect(widget, findsOneWidget);
    });

    testWidgets("Should renderer event list tile", (widgetTester) async {
      await mockNetworkImagesFor(() async => await widgetTester.pumpWidget(MaterialApp(home: CharacterDetailPage(character: character))));
      final widget = find.byKey(const Key("events_tile"));
      expect(widget, findsOneWidget);
    });

    testWidgets("Should renderer comic list tile", (widgetTester) async {
      await mockNetworkImagesFor(() async => await widgetTester.pumpWidget(MaterialApp(home: CharacterDetailPage(character: character))));
      final widget = find.byKey(const Key("comics_tile"));
      expect(widget, findsOneWidget);
    });

    testWidgets("Should renderer stories list tile", (widgetTester) async {
      await mockNetworkImagesFor(() async => await widgetTester.pumpWidget(MaterialApp(home: CharacterDetailPage(character: character))));
      final widget = find.byKey(const Key("stories_tile"));
      expect(widget, findsOneWidget);
    });

    testWidgets("Should renderer links list tile", (widgetTester) async {
      await mockNetworkImagesFor(() async => await widgetTester.pumpWidget(MaterialApp(home: CharacterDetailPage(character: character))));
      final widget = find.byKey(const Key("links_tile"));
      expect(widget, findsOneWidget);
    });

    testWidgets("Should renderer go auto app bar back button", (widgetTester) async {
      await mockNetworkImagesFor(() async => await widgetTester.pumpWidget(MaterialApp(home: CharacterDetailPage(character: character))));
      final widget = find.byType(AppBar);
      final appbar = widgetTester.widget<AppBar>(widget);
      final backButton = appbar.leading;
      final autoLeader = appbar.automaticallyImplyLeading;
      expect(backButton, isNull);
      expect(autoLeader, isTrue);
    });
  });
}
