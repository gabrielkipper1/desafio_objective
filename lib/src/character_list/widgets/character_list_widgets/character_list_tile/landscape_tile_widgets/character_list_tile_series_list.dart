import 'dart:math';

import 'package:desafio_objective/src/entities/generic/marvel_api_collection_data.dart';
import 'package:desafio_objective/src/entities/serie.dart';
import 'package:flutter/material.dart';

class CharacterListTileSerieList extends StatelessWidget {
  final MarvelAPICollectionData<Serie> series;
  const CharacterListTileSerieList({required this.series, super.key});

  @override
  Widget build(BuildContext context) {
    List<Serie> displayList = series.items.sublist(0, min(series.returned, 5));
    bool hasMore = series.returned > 5;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        key: const Key('series_list'),
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var item in displayList) Text(item.name),
          if (hasMore) Text('e ${series.returned - 5} mais...'),
        ],
      ),
    );
  }
}
