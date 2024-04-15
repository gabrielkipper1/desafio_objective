import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/character_list_tile/landscape_tile_widgets/character_list_tile_event_list.dart';
import 'package:desafio_objective/src/entities/event.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_collection_data.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late List<Event> events;

  setUp(() {
    events = [
      Event(name: "Event 1", resourceURI: "http://event1.com"),
      Event(name: "Event 2", resourceURI: "http://event2.com"),
      Event(name: "Event 3", resourceURI: "http://event3.com"),
      Event(name: "Event 4", resourceURI: "http://event4.com"),
      Event(name: "Event 5", resourceURI: "http://event5.com"),
      Event(name: "Event 6", resourceURI: "http://event6.com"),
    ];
  });

  group("Character List Tile Events ", () {
    testWidgets("should pass 4 events and get a list of 4 children in the event list widget", (tester) async {
      await tester.pumpWidget(
        CharacterListTileEventList(
          events: MarvelAPICollectionData(
            available: 10,
            returned: 4,
            collectionURI: "",
            items: events.sublist(0, 4),
          ),
        ),
      );

      final eventList = find.byKey(const Key('event_list'));
      final column = tester.widget<Column>(eventList);
      expect(eventList, findsOneWidget);
      expect(column.children.length, 4);
    });

    testWidgets("should pass 6 events and get a list of 6 children in the event list widget: 5 events and a 'has more' text",
        (tester) async {
      await tester.pumpWidget(
        CharacterListTileEventList(
          events: MarvelAPICollectionData(
            available: 10,
            returned: 6,
            collectionURI: "",
            items: events,
          ),
        ),
      );

      final eventList = find.byKey(const Key('event_list'));
      final column = tester.widget<Column>(eventList);
      expect(eventList, findsOneWidget);
      expect(column.children.length, 6);
    });

    testWidgets("should pass 0 events and get an empty list in the event list widget", (tester) async {
      await tester.pumpWidget(
        CharacterListTileEventList(
          events: MarvelAPICollectionData(
            available: 10,
            returned: 0,
            collectionURI: "",
            items: [],
          ),
        ),
      );

      final eventList = find.byKey(const Key('event_list'));
      final column = tester.widget<Column>(eventList);
      expect(eventList, findsOneWidget);
      expect(column.children.length, 0);
    });
  });
}
