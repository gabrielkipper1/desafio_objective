import 'dart:convert';

import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/character_list_header/character_list_header_widget.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/character_list_view.dart';
import 'package:desafio_objective/src/entities/character.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_request_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../sample_data/testingSampleData.dart';

void main() {
  late Widget widget;

  setUp(() {
    Map<String, dynamic> json = jsonDecode(testingSampleData("/json/characters.json"));

    widget = ResponsiveBreakpoints.builder(
      breakpoints: [
        const Breakpoint(start: 100, end: 700, name: MOBILE),
      ],
      child: Material(
        child: CharacterListView(
          request: MarvelApiRequestData<Character>.fromJson(
            json["data"],
            (characterJson) => Character.fromJson(characterJson),
          ),
        ),
      ),
    );
  });

  group("Character List View", () {
    testWidgets('checks if there is a list of characters and the character count is correct', (tester) async {
      await mockNetworkImagesFor(() async => await tester.pumpWidget(widget));
      final listHeader = find.byKey(const Key("list_header"));
      final characterList = find.byKey(const Key("character_list"));

      expect(listHeader, findsOneWidget);
      expect(characterList, findsOneWidget);

      final list = tester.widget<Column>(characterList);
      // list header + 2 characters in the list
      expect(list.children.length, 3);
    });

    testWidgets('should have a list header', (tester) async {
      await mockNetworkImagesFor(() async => await tester.pumpWidget(widget));
      final characterList = find.byKey(const Key("list_header"));
      final listHeader = tester.widget<CharacterListHeaderWidget>(characterList);
      expect(listHeader, isNotNull);
    });
  });
}
