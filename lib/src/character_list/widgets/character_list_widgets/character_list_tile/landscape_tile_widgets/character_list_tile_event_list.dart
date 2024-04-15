import 'dart:math';

import 'package:desafio_objective/src/entities/event.dart';
import 'package:desafio_objective/src/entities/generic/marvel_api_collection_data.dart';
import 'package:flutter/material.dart';

class CharacterListTileEventList extends StatelessWidget {
  final MarvelAPICollectionData<Event> events;
  const CharacterListTileEventList({required this.events, super.key});

  @override
  Widget build(BuildContext context) {
    List<Event> displayList = events.items.sublist(0, min(events.returned, 5));
    bool hasMore = events.returned > 5;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        key: const Key('event_list'),
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var item in displayList) Text(item.name),
          if (hasMore) Text('e ${events.returned - 5} mais...'),
        ],
      ),
    );
  }
}
