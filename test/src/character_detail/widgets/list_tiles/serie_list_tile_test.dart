import 'package:desafio_objective/src/features/character_detail/widgets/list_tiles/serie_list_tile.dart';
import 'package:desafio_objective/src/entities/serie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Serie List Tile", () {
    testWidgets("Should show the serie name", (tester) async {
      Serie serie = Serie(name: "Serie Name", resourceURI: "http://serie.com");
      await tester.pumpWidget(Material(child: SerieListTile(serie: serie)));
      expect(find.text("Serie Name"), findsOneWidget);
    });
  });
}
