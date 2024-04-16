import 'package:desafio_objective/src/features/character_detail/widgets/list_tiles/story_list_tile.dart';
import 'package:desafio_objective/src/entities/story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Story List Tile", () {
    testWidgets("Should show the story name", (tester) async {
      Story story = Story(name: "Story Name", type: "Story Type", resourceURI: "http://story.com");
      await tester.pumpWidget(Material(child: StoryListTile(story: story)));
      expect(find.text("Story Name"), findsOneWidget);
      expect(find.text("Story Type"), findsOneWidget);
    });
  });
}
