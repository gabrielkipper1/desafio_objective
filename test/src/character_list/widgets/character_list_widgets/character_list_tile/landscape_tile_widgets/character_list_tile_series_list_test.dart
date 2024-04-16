import 'package:desafio_objective/src/features/character_list/widgets/character_list_widgets/character_list_tile/landscape_tile_widgets/character_list_tile_series_list.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_collection_data.dart';
import 'package:desafio_objective/src/entities/serie.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late List<Serie> series;
  group("Character List Tile Series List", () {
    setUp(() {
      series = [
        Serie(name: "Serie 1", resourceURI: "http://serie1.com"),
        Serie(name: "Serie 2", resourceURI: "http://serie2.com"),
        Serie(name: "Serie 3", resourceURI: "http://serie3.com"),
        Serie(name: "Serie 4", resourceURI: "http://serie4.com"),
        Serie(name: "Serie 5", resourceURI: "http://serie5.com"),
        Serie(name: "Serie 6", resourceURI: "http://serie6.com"),
      ];
    });

    testWidgets("should pass 4 series and get a list of 4 children in the serie list widget", (tester) async {
      await tester.pumpWidget(
        CharacterListTileSerieList(
          series: MarvelAPICollectionData(
            available: 10,
            returned: 4,
            collectionURI: "",
            items: series.sublist(0, 4),
          ),
        ),
      );

      final serieList = find.byKey(const Key('series_list'));
      final column = tester.widget<Column>(serieList);
      expect(serieList, findsOneWidget);
      expect(column.children.length, 4);
    });

    testWidgets("should pass 6 series and get a list of 6 children in the serie list widget: 5 series and a 'has more' text",
        (tester) async {
      await tester.pumpWidget(
        CharacterListTileSerieList(
          series: MarvelAPICollectionData(
            available: 10,
            returned: 6,
            collectionURI: "",
            items: series,
          ),
        ),
      );

      final serieList = find.byKey(const Key('series_list'));
      final column = tester.widget<Column>(serieList);
      expect(serieList, findsOneWidget);
      expect(column.children.length, 6);
    });

    testWidgets("should pass 0 series and get an empty list in the serie list widget", (tester) async {
      await tester.pumpWidget(
        CharacterListTileSerieList(
          series: MarvelAPICollectionData(
            available: 10,
            returned: 0,
            collectionURI: "",
            items: [],
          ),
        ),
      );

      final serieList = find.byKey(const Key('series_list'));
      final column = tester.widget<Column>(serieList);
      expect(serieList, findsOneWidget);
      expect(column.children.length, 0);
    });
  });
}
