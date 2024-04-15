import 'package:desafio_objective/src/character_detail/widgets/list_tiles/url_list_tile.dart';
import 'package:desafio_objective/src/entities/marvel_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Url List Tile", () {
    testWidgets("Should show the url", (tester) async {
      MarvelUrl url = MarvelUrl(url: "http://url.com", type: "Url Type");
      await tester.pumpWidget(Material(child: UrlListTile(url: url)));
      expect(find.text("http://url.com"), findsOneWidget);
      expect(find.text("Url Type"), findsOneWidget);
    });
  });
}
