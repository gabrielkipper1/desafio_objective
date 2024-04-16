import 'package:desafio_objective/src/features/character_detail/widgets/list_tiles/comics_list_tile.dart';
import 'package:desafio_objective/src/entities/comic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Comics List Tile", () {
    testWidgets("Should show the comic name", (tester) async {
      Comic comic = Comic(name: "Comic Name", resourceURI: "http://comic.com");
      await tester.pumpWidget(Material(child: ComicsListTile(comic: comic)));
      expect(find.text("Comic Name"), findsOneWidget);
    });
  });
}
