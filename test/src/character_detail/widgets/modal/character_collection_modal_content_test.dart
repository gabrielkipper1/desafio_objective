import 'dart:convert';

import 'package:desafio_objective/src/features/character_detail/widgets/list_tiles/comics_list_tile.dart';
import 'package:desafio_objective/src/features/character_detail/widgets/modal/character_collection_modal_content.dart';
import 'package:desafio_objective/src/entities/character.dart';
import 'package:desafio_objective/src/entities/comic.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_request_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../sample_data/testingSampleData.dart';

void main() {
  group("Character Collection Modal Content", () {
    late Character character;

    setUp(() {
      Map<String, dynamic> json = jsonDecode(testingSampleData("/json/characters.json"))["data"];
      character = MarvelApiRequestData.fromJson(json, (json) => Character.fromJson(json)).results.first;
    });

    testWidgets("Should show the correct character counter ", (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CharacterCollectionModalContent<Comic>(
            collectionData: character.comics,
            pageTitle: 'Comics',
            itemListBuilder: (item) => ComicsListTile(comic: item),
          ),
        ),
      );

      expect(find.text('Comics'), findsOneWidget);
      expect(find.byType(ComicsListTile), findsNWidgets(character.comics.items.length));
    });
  });
}
