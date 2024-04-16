import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/character_list_tile/character_list_tile_landscape.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/character_list_tile/character_name_photo_widget.dart';
import 'package:desafio_objective/src/entities/character.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CharacterListTileBuilder extends StatelessWidget {
  final Character character;
  const CharacterListTileBuilder({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context).breakpoint;
    if (breakpoint.name == MOBILE) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CharacterNameAndPhotoWidget(character: character),
      );
    } else {
      return CharacterListTileLandscapeWidget(character: character);
    }
  }
}
