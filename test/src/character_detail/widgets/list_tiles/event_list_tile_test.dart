import 'package:desafio_objective/src/character_detail/widgets/list_tiles/event_list_tile.dart';
import 'package:desafio_objective/src/entities/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Event List Tile", () {
    testWidgets("Should show the event name", (tester) async {
      Event event = Event(name: "Event Name", resourceURI: "http://event.com");
      await tester.pumpWidget(Material(child: EventListTile(event: event)));
      expect(find.text("Event Name"), findsOneWidget);
    });
  });
}
