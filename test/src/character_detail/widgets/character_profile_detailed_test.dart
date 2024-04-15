import 'dart:convert';

import 'package:desafio_objective/src/character_detail/widgets/character_profile_detailed.dart';
import 'package:desafio_objective/src/entities/character.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_collection_data.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_request_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../sample_data/testingSampleData.dart';

void main() {
  group("Character Profile Detailed", () {
    late Character character;

    setUp(() {
      Map<String, dynamic> json = jsonDecode(testingSampleData("/json/characters.json"));
      var request = MarvelApiRequestData<Character>.fromJson(json["data"], (json) => Character.fromJson(json));
      character = request.results.first;
    });

    testWidgets("Should show the character, character description and image", (tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(Material(child: CharacterProfileDetailed(character: character))));
      expect(find.text(character.name), findsOneWidget);
      expect(find.text(character.description), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });
  });
}
