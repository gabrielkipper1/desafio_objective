import 'package:desafio_objective/src/features/character_list/widgets/character_list_widgets/character_list_tile/landscape_tile_widgets/character_list_tile_event_list.dart';
import 'package:desafio_objective/src/features/character_list/widgets/character_list_widgets/character_list_tile/character_name_photo_widget.dart';
import 'package:desafio_objective/src/features/character_list/widgets/character_list_widgets/character_list_tile/landscape_tile_widgets/character_list_tile_series_list.dart';
import 'package:desafio_objective/src/entities/character.dart';
import 'package:flutter/material.dart';

class CharacterListTileLandscapeWidget extends StatelessWidget {
  final Character character;
  const CharacterListTileLandscapeWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              key: const Key("flex_profile"),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CharacterNameAndPhotoWidget(character: character),
              ),
            ),
            Expanded(
                flex: 1,
                key: const Key("flex_series"),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CharacterListTileSerieList(series: character.series),
                )),
            Expanded(
                flex: 2,
                key: const Key("flex_events"),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CharacterListTileEventList(events: character.events),
                )),
          ],
        ),
      ),
    );
  }
}
