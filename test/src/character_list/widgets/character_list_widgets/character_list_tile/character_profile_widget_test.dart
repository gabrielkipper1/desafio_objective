import 'dart:convert';

import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/character_list_tile/character_profile_widget.dart';
import 'package:desafio_objective/src/entities/character.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_request_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../sample_data/testingSampleData.dart';

void main() {
  group("Character Name Widget", () {
    late Character character;
    late Widget widget;

    setUp(() {
      Map<String, dynamic> json = jsonDecode(testingSampleData("/json/characters.json"));
      MarvelApiRequestData<Character> request = MarvelApiRequestData<Character>.fromJson(
        json["data"],
        (characterJson) => Character.fromJson(characterJson),
      );
      character = request.results.first;

      widget = Material(
        child: CharacterProfileWidget(
          character: character,
        ),
      );
    });

    testWidgets("should have a character name text", (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(widget);
      });
      final characterName = find.byKey(const Key("character_name"));
      final textWidget = tester.widget<Text>(characterName);
      expect(characterName, findsOneWidget);
      expect(textWidget.data, character.name);
    });

    testWidgets("should have a character image widget", (widgetTester) async {
      await mockNetworkImagesFor(() async {
        await widgetTester.pumpWidget(widget);
      });
      final characterPhoto = find.byKey(const Key("character_image"));
      expect(characterPhoto, findsOneWidget);
    });
  });
}
